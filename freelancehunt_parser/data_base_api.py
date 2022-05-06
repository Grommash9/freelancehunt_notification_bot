import time
from freelancehunt_parser.base import sync_create_con


def add_project_to_data_base(project_data: dict) -> int:
    con, cur = sync_create_con()
    cur.execute('insert into dev_freelancehunt_bot.project_data (project_website_id, project_name, project_description, url, time_added) '
                'values (%s, %s, %s, %s, %s) ',
                (project_data['id'], project_data['attributes']['name'], project_data['attributes']['description'][:3000],
                 project_data['links']['self']['web'], round(time.time())))

    con.commit()

    new_project_id = cur.lastrowid
    cur.executemany('insert into dev_freelancehunt_bot.project_skills (project_id, skill_id) '
                    'values (%s, %s) ',
                    [(new_project_id, skills['id'])
                     for skills in project_data['attributes']['skills']])
    con.commit()
    con.close()
    return new_project_id


def add_skills(skills_list: list) -> None:
    con, cur = sync_create_con()
    cur.executemany('insert into dev_freelancehunt_bot.skill_list (skill_id, skill_name) '
                          'values (%s, %s) ON DUPLICATE KEY UPDATE skill_name = VALUES (skill_name) ',
                          [(skill_data['id'], skill_data['name'])
                           for skill_data in skills_list])
    con.commit()
    con.close()


def new_project(project_website_id: int) -> bool:
    con, cur = sync_create_con()
    cur.execute('select project_website_id '
                'from dev_freelancehunt_bot.project_data '
                'where project_website_id = %s',
                (project_website_id,))
    project_id = cur.fetchone()
    con.close()
    if project_id is None:
        return True
    else:
        return False
