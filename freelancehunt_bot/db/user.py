from pymysql import IntegrityError

from .base import create_con, create_dict_con


async def add_new_user(user_id: int) -> None:
    con, cur = await create_con()
    try:
        await cur.execute('insert into dev_freelancehunt_bot.user (user_id) values (%s)', (user_id,))
    except IntegrityError:
        pass
    else:
        await cur.execute('select skill_id from dev_freelancehunt_bot.skill_list ')
        skill_list = await cur.fetchall()
        await cur.executemany(
            'insert into dev_freelancehunt_bot.users_skills (user_id, skill_id, is_interested) values (%s, %s, %s) ',
            [(user_id, skill, 0) for skill in skill_list])

        await con.commit()
    finally:
        await con.ensure_closed()
