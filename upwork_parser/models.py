import re
import time

from upwork_parser import config, db
import feedparser
import requests

from upwork_parser.db.data_base_api import UpworkProject


class UpworkParser:
    target_url = 'https://www.upwork.com/ab/feed/jobs/rss?q=telegram+api&sort=recency&ontology_skill_uid=1031626721043398656%2C1031626785585348608&paging=0%3B10&api_params=1&securityToken=abd1d135542c9bc3cb9f9a323a49ec2f72f916d222765d899ccfa29e32dfe42429f44e83a542b7a26d409801d6e02d97f0016f7e12524e2eebfcbe02470062ac&userUid=1559813050204078080&orgUid=1559813050204078081'
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






