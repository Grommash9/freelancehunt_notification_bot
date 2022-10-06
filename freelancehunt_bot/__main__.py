from aiogram.dispatcher.webhook import get_new_configured_app
from aiohttp import web

from freelancehunt_bot import config
from freelancehunt_bot.misc import dp, bot, routes


async def on_startup(_dispatcher):
    # await bot.set_webhook(config.WEBHOOK_URL)
    await bot.set_webhook(config.WEBHOOK_URL, certificate=open('/etc/nginx/ssl/nginx.crt', 'r'))
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
    #executor.start_polling(dp, skip_updates=True)
    app = get_new_configured_app(dispatcher=dp, path=f'/{config.WEBHOOK_PATH}/')
    app.add_routes(routes)
    setup_bot(app)
    web.run_app(app, **config.BOT_SERVER)









