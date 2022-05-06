from aiogram.dispatcher import FSMContext
from aiogram.types import Message, ChatType

from freelancehunt_bot import keyboards
from freelancehunt_bot.misc import dp, bot
from freelancehunt_bot.states.user import User
from freelancehunt_bot import db


@dp.message_handler(chat_type=ChatType.PRIVATE, commands=['start'], state='*')
async def process_start(message: Message, state: FSMContext):
    await state.finish()
    await state.set_state(User.main)
    await db.user.add_new_user(message.from_user.id)

    await bot.send_message(chat_id=message.chat.id,
                           text='Привет, я бот для оповещения о новых заказах на фрилансе.\n'
                                'Выбери специалости на которые ты хотел бы подписаться!',
                           reply_markup=keyboards.users.main_menu())


@dp.message_handler(text='Исходный код', state=User.main)
async def get_source_code_url(message: Message):
    await bot.send_message(message.from_user.id,
                           'https://github.com/Grommash9/freelancehunt_notification_bot')
