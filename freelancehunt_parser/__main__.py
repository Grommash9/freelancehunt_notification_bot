import time

from freelancehunt_parser.freelancehunt_parsing import get_projects

if __name__ == '__main__':
    while True:
        get_projects()
        time.sleep(5)
