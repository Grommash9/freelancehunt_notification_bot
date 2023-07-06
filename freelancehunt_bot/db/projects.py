from pymysql import IntegrityError
from .base import create_con, create_dict_con


async def get_project(project_id: int) -> dict or None:
    con, cur = await create_dict_con()
    await cur.execute('select * from dev_freelancehunt_bot.project_data where project_id = %s', (project_id, ))
    project_data = await cur.fetchone()
    await cur.execute('select skill_list.skill_id, skill_list.skill_name from dev_freelancehunt_bot.project_skills '
                    'join dev_freelancehunt_bot.skill_list as skill_list '
                    'on skill_list.skill_id = project_skills.skill_id '
                    'where project_skills.project_id = %s ', (project_id, ))
    project_skills_list = await cur.fetchall()
    if project_skills_list:
        project_data['project_skills_list'] = project_skills_list
    await cur.execute('select DISTINCT(user_id) from dev_freelancehunt_bot.project_skills '
                        'join dev_freelancehunt_bot.users_skills as users_skills '
                        'on users_skills.skill_id = project_skills.skill_id '
                        'where project_skills.project_id = %s and users_skills.is_interested ', (project_id,))
    interested_users_list = await cur.fetchall()
    if interested_users_list:
        project_data['interested_users_list'] = interested_users_list
    await con.ensure_closed()
    return project_data


