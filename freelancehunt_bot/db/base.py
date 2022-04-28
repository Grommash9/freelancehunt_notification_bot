from aiomysql import connect, Connection, Cursor, DictCursor
from pymysql import connect as sync_connect

from freelancehunt_bot.config import MYSQL


async def create_con():
    con: Connection = await connect(**MYSQL)
    cur: Cursor = await con.cursor()
    return con, cur


async def create_dict_con():
    con: Connection = await connect(**MYSQL)
    cur: DictCursor = await con.cursor(DictCursor)
    return con, cur


def sync_create_con():
    con = sync_connect(**MYSQL)
    cur = con.cursor()
    return con, cur
