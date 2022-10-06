import time
from upwork_parser.db.base import sync_create_con
from dataclasses import dataclass


@dataclass
class UpworkProject:
    project_name: str
    project_description: str
    url: str
    time_added: int


def add_project_to_data_base(project_data: UpworkProject) -> int:
    con, cur = sync_create_con()
    cur.execute('insert into dev_freelancehunt_bot.project_data (project_name, project_description, url, time_added) '
                'values (%s, %s, %s, %s) ',
                (project_data.project_name, project_data.project_description, project_data.url,
                 project_data.time_added,))

    con.commit()

    new_project_id = cur.lastrowid
    cur.execute('insert into dev_freelancehunt_bot.project_skills (project_id, skill_id) '
                    'values (%s, %s) ', (new_project_id, 185))
    con.commit()
    con.close()
    return new_project_id


def new_project(url: str) -> bool:
    con, cur = sync_create_con()
    cur.execute('select project_website_id '
                'from dev_freelancehunt_bot.project_data '
                'where url = %s',
                (url,))
    project_id = cur.fetchone()
    con.close()
    if project_id is None:
        return True
    else:
        return False



