import re
import time

from upwork_parser import config, db
import feedparser
import requests

from upwork_parser.db.data_base_api import UpworkProject

def get_clear_description(raw_description):
    clear_description = re.sub('<br />', '\n', raw_description)
    clear_description = re.sub('&#039', '', clear_description)
    clear_description = re.sub('&nbsp;', '', clear_description)
    clear_description = re.sub('&amp;', '', clear_description)
    return clear_description


class UpworkParser:

    def get_projects(self):
        for source in db.upwork_source.get_all():

            NewsFeed = feedparser.parse(source.url)

            for data in NewsFeed.entries:
                project = UpworkProject(project_name=data.title,
                                        project_description=get_clear_description(data.summary)[:3000],
                                        url=data.links[0].href,
                                        time_added=round(time.time()))
                if db.data_base_api.new_project(data.links[0].href):

                    project_id = db.data_base_api.add_project_to_data_base(project, source.skill_id)
                    self.send_to_users(project_id)

    def send_to_users(self, new_project_id):
        requests.post(f"{config.WEBHOOK_HOST}/new_project/?id={new_project_id}", verify=False)






