from dataclasses import dataclass
from upwork_parser.db.base import sync_create_con


@dataclass
class UpworkSource:
    source_id: int
    url: str
    skill_id: int


def get_all():
    con, cur = sync_create_con()
    cur.execute('select * from upwork_source')
    upwork_source_list = cur.fetchall()
    con.close()
    return [UpworkSource(source[0], source[1], source[2]) for source in upwork_source_list]