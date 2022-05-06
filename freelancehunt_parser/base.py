from aiomysql import connect, Connection, Cursor, DictCursor
from pymysql import connect as sync_connect

from freelancehunt_parser.config import MYSQL


def sync_create_con():
    con = sync_connect(**MYSQL)
    cur = con.cursor()
    return con, cur
