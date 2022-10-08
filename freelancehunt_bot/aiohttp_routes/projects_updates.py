import asyncio

from freelancehunt_bot.misc import routes, bot
from freelancehunt_bot import db


@routes.post('/new_project/')
async def get_handler(request):
    project_data = await db.projects.get_project(int(request.query['id']))
    if project_data:
        if 'interested_users_list' in project_data.keys():
            for users in project_data['interested_users_list']:
                skills_text = ''
                for skills in project_data['project_skills_list']:
                    skills_text += f'<b>{skills["skill_name"]}</b> '
                try:
                    await bot.send_message(chat_id=users['user_id'], text=f"{skills_text}\n\n"
                                                                          f"{project_data['project_name']}\n\n"
                                                                          f"{project_data['project_description']}\n\n"
                                                                          f"{project_data['url']}")
                except Exception:
                    pass

