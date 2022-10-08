from aiogram.types import Message
from freelancehunt_bot.states.user import User
from freelancehunt_bot.misc import dp, bot
from aiogram.dispatcher import FSMContext



@dp.message_handler(text='Статистика', state=User.main)
async def get_stats_url(message: Message):
    await bot.send_message(message.from_user.id,
                           'https://datastudio.google.com/reporting/b6d92c17-2b78-46d7-9b11-1bcea696b8f5')
