from asyncio import get_event_loop
from typing import Tuple, Any
import aioredis
import os
from aiogram import Dispatcher, Bot
from aiogram import types
from aiogram.contrib.fsm_storage.redis import RedisStorage2
from aiogram.contrib.middlewares.i18n import I18nMiddleware
from aiohttp import web
from babel.core import Locale
from bot_app import db
from bot_app.config import BOT_TOKEN, REDIS
from bot_app.config import I18N_DOMAIN, LOCALES_DIR

loop = get_event_loop()
bot = Bot(BOT_TOKEN, parse_mode='HTML')
storage = RedisStorage2(**REDIS, loop=loop)
dp = Dispatcher(bot, loop, storage)
redis = aioredis.Redis(decode_responses=True)
routes = web.RouteTableDef()
