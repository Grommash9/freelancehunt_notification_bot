from .base import create_con, create_dict_con


async def get_user_skills(user_id: int) -> list:
    con, cur = await create_dict_con()
    await cur.execute('select sl.skill_id, sl.skill_name, us.is_interested '
                        'from dev_freelancehunt_bot.users_skills us '
                        'join dev_freelancehunt_bot.skill_list sl '
                        'on sl.skill_id = us.skill_id '
                        'where user_id = %s ', (user_id,))
    skills_list = await cur.fetchall()
    await con.ensure_closed()
    return skills_list


async def switch_user_skill(user_id: int, skill_id: int) -> list:
    con, cur = await create_dict_con()
    await cur.execute('update dev_freelancehunt_bot.users_skills set is_interested = not is_interested '
                      'where user_id = %s and skill_id =%s ',
                      (user_id, skill_id,))
    await con.commit()
    await cur.execute('select sl.skill_id, sl.skill_name, us.is_interested '
                      'from dev_freelancehunt_bot.users_skills us '
                      'join dev_freelancehunt_bot.skill_list sl '
                      'on sl.skill_id = us.skill_id '
                      'where user_id = %s ', (user_id,))
    skills_list = await cur.fetchall()
    await con.ensure_closed()
    return skills_list


async def get_skill_id(skill_name: str) -> int or None:
    con, cur = await create_dict_con()
    await cur.execute('select skill_list.skill_id from dev_freelancehunt_bot.skill_list where skill_name = %s', (skill_name,))
    skill_id = await cur.fetchone()
    await con.ensure_closed()
    return skill_id

