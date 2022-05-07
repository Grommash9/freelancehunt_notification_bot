from aiogram import executor
from aiogram.dispatcher.webhook import get_new_configured_app
from aiogram.utils.executor import start_webhook
from aiohttp import web

from freelancehunt_bot.misc import dp, bot, routes
from freelancehunt_bot.db import check_and_create_db
from freelancehunt_bot import config


async def on_startup(_dispatcher):
    await bot.set_webhook(config.WEBHOOK_URL)
    print(await bot.get_webhook_info())
    print(await bot.get_me())


async def on_shutdown(_dispatcher):
    await bot.delete_webhook()
    await bot.session.close()
    await dp.storage.close()
    await dp.storage.wait_closed()


def setup_bot(app: web.Application):
    app.on_startup.append(on_startup)
    app.on_shutdown.append(on_shutdown)


if __name__ == '__main__':
    # check_and_create_db.create_data_base()
    #executor.start_polling(dp, skip_updates=True)
    app = get_new_configured_app(dispatcher=dp, path=f'/{config.WEBHOOK_PATH}/')
    app.add_routes(routes)
    setup_bot(app)
    web.run_app(app, **config.BOT_SERVER)









