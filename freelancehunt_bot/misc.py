from asyncio import get_event_loop
from freelancehunt_bot.config import TOKEN, REDIS
from aiogram import Dispatcher, Bot
from aiogram.contrib.fsm_storage.redis import RedisStorage2

loop = get_event_loop()
bot = Bot(TOKEN, parse_mode='HTML', loop=loop)
storage = RedisStorage2(**REDIS, loop=loop)
dp = Dispatcher(bot, loop, storage)

