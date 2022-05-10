import json
import config
import requests
from freelancehunt_parser import data_base_api, config
from freelancehunt_parser.data_base_api import add_skills, new_project

headers = {
    'Authorization': f'Bearer {config.api_key}',
}


def get_skills() -> list or None:
    data = requests.get('https://api.freelancehunt.com/v2/skills', headers=headers)
    if data.status_code == 200:
        skills_data = data.json()
        return skills_data['data']
    else:
        return None


def get_skills_numbers() -> list or None:
    data = requests.get('https://api.freelancehunt.com/v2/skills', headers=headers)
    if data.status_code == 200:
        skills_data = data.json()
        skills_list_id = [skill['id'] for skill in skills_data['data']]
        return skills_list_id
    else:
        return None


def get_projects():
    skill_ids_list = get_skills_numbers()
    if skill_ids_list is None:
        return 0
    data = requests.get(f'https://api.freelancehunt.com/v2/projects?filter[skill_id]={",".join(str(x) for x in skill_ids_list)}', headers=headers)
    if not data.status_code == 200:
        return 0
    for projects in data.json()['data']:
        if new_project(projects['id']):
            new_project_id = data_base_api.add_project_to_data_base(project_data=projects)
            requests.post(f"{config.WEBHOOK_URL}?id={new_project_id}")
    return 1


get_projects()