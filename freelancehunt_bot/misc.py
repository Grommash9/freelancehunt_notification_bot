from asyncio import get_event_loop

from aiohttp import web

from freelancehunt_bot.config import TOKEN, REDIS
from aiogram import Dispatcher, Bot
from aiogram.contrib.fsm_storage.redis import RedisStorage2

loop = get_event_loop()
storage = RedisStorage2(**REDIS, loop=loop)
bot = Bot(token=TOKEN, parse_mode='HTML', loop=loop)
dp = Dispatcher(bot, loop, storage)
routes = web.RouteTableDef()
