import logging
from aiogram import executor
from aiogram.dispatcher.webhook import get_new_configured_app
from aiogram.types import AllowedUpdates
from aiohttp import web
from aiogram.contrib.middlewares.logging import LoggingMiddleware
from bot_app import config
from bot_app.misc import dp, bot, routes, scheduler, i18n


async def on_startup(_dispatcher):
    await bot.set_webhook(
        config.WEBHOOK_URL,
        allowed_updates=AllowedUpdates.CALLBACK_QUERY + AllowedUpdates.MESSAGE + AllowedUpdates.MY_CHAT_MEMBER
        + AllowedUpdates.CHAT_MEMBER + AllowedUpdates.CHAT_JOIN_REQUEST + AllowedUpdates.CHANNEL_POST)

    webhook_info = await bot.get_webhook_info()
    print(webhook_info)
    bot_data = await bot.get_me()
    print(bot_data)


async def on_shutdown(_dispatcher):
    await bot.delete_webhook(drop_pending_updates=True)
    await bot.session.close()
    await dp.storage.close()
    await dp.storage.wait_closed()


def setup_bot(app: web.Application):
    app.on_startup.append(on_startup)
    app.on_shutdown.append(on_shutdown)


if __name__ == '__main__':
    scheduler.start()
    logging.basicConfig(level=logging.INFO)
    dp.middleware.setup(LoggingMiddleware())
    dp.middleware.setup(i18n)

    if int(config.POLLING):
        executor.start_polling(dp, skip_updates=True)
    else:
        app = get_new_configured_app(dispatcher=dp, path=f'/{config.WEBHOOK_PATH}/')
        app.add_routes(routes)
        setup_bot(app)
        web.run_app(app, **config.BOT_SERVER)
