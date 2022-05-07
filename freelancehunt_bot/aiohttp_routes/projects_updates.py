from freelancehunt_bot.misc import routes, bot
from freelancehunt_bot import db


@routes.post('/new_project/')
async def get_handler(request):
    print('da')
    print(dir(request))
    print(request.ATTRS)
    print(request.headers)
    print(request.query_string)
    print(request.query['id'])

    if not 'id' in request.query:
        return
    project_data = await db.projects.get_project(int(request.query['id']))
    if project_data:
        if 'interested_users_list' in project_data.keys():
            await bot.send_message(chat_id=999678965, text=str(project_data))
    else:
        print('interested_users_list is none')
