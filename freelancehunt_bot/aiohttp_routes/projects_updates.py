import asyncio

from freelancehunt_bot.misc import routes, bot
from freelancehunt_bot import db


@routes.post('/new_project/')
async def get_handler(request):
    project_data = await db.projects.get_project(int(request.query['id']))
    if project_data:
        if 'interested_users_list' in project_data.keys():
            print(project_data)
            for users in project_data['interested_users_list']:
                await bot.send_message(chat_id=users, text=str(project_data))
                await asyncio.sleep(1)
    else:
        pass
