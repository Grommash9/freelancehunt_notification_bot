import json

import requests
from freelancehunt_parser import data_base_api, config
from freelancehunt_parser.data_base_api import add_skills, new_project
import http.client

headers = {
    'Authorization': f'Bearer {config.api_key}',
}


def get_projects():
    skill_ids_list = data_base_api.get_skills()
    conn = http.client.HTTPSConnection("api.freelancehunt.com")
    payload = ''
    conn.request("GET", f'/v2/projects?filter[skill_id]={",".join(str(x) for x in skill_ids_list)}', payload, headers)
    res = conn.getresponse()
    data = res.read()

    json_data = json.loads(data.decode('utf-8'))
    for projects in json_data['data']:
        if new_project(projects['id']):

            new_project_id = data_base_api.add_project_to_data_base(project_data=projects)
            requests.post(f"{config.WEBHOOK_HOST}/new_project/?id={new_project_id}", verify=False)
    return 1




