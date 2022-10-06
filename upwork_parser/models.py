import re
import time

from upwork_parser import config, db
import feedparser
import requests

from upwork_parser.db.data_base_api import UpworkProject


class UpworkParser:
    target_url = 'https://www.upwork.com/ab/feed/topics/rss?securityToken=b3f06767f8788a59202c4afbc7ac3ccc468bef9d5693a368e1ab0125f74673812af43d66453ada4390010b7315950996a9a57e2d2ab74b7504e5e99cc0906dfd&userUid=1506609718993432576&orgUid=1561868530043547649&topic=most-recent'
    CLEANR = re.compile('<.*?>')

    def cleanhtml(self, raw_html):
        cleantext = re.sub(self.CLEANR, '', raw_html)
        return cleantext

    def get_projects(self):
        NewsFeed = feedparser.parse(self.target_url)

        for data in NewsFeed.entries:
            project = UpworkProject(project_name=data.title,
                                    project_description=self.cleanhtml(data.summary)[:3000],
                                    url=data.links[0].href,
                                    time_added=round(time.time()))
            if db.data_base_api.new_project(data.links[0].href):

                project_id = db.data_base_api.add_project_to_data_base(project)
                self.send_to_users(project_id)

    def send_to_users(self, new_project_id):
        requests.post(f"{config.WEBHOOK_HOST}/new_project/?id={new_project_id}", verify=False)






