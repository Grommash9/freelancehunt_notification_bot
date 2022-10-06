import time
from upwork_parser.models import UpworkParser

if __name__ == '__main__':
    while True:
        a = UpworkParser()
        a.get_projects()
        time.sleep(5)
