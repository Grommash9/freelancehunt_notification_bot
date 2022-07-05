import aiogram.types
from aiogram.types import Message, Update
from freelancehunt_bot.states.user import User
from freelancehunt_bot.misc import dp, bot
from freelancehunt_bot import db
from freelancehunt_bot import keyboards
from aiogram.dispatcher import FSMContext
import re


@dp.message_handler(text='Настройка подписок', state=User.main)
async def subscriptions_settings(message: Message, state: FSMContext):
    user_skills = await db.user_subscriptions.get_user_skills(message.from_user.id)
    await state.set_state(User.NewSkills.skill_name)
    await bot.send_message(chat_id=message.from_user.id,
                           text='Пожалуйста выберите подписки',
                           reply_markup=keyboards.users.subscription_menu(user_skills))


@dp.message_handler(text='Назад', state=User.NewSkills.skill_name)
async def subscriptions_switcher(message: Message, state: FSMContext):
    await state.finish()
    await state.set_state(User.main)
    await bot.send_message(chat_id=message.from_user.id,
                           text='Вы в главном меню',
                           reply_markup=keyboards.users.main_menu())


@dp.message_handler(content_types=aiogram.types.ContentType.TEXT, state=User.NewSkills.skill_name)
async def subscriptions_switcher(message: Message, state: FSMContext):
    skill_data = await db.user_subscriptions.get_skill_id(' '.join(re.findall('([^✔ ]{1,50})', message.text)))
    if skill_data is None:
        await bot.send_message(text='Введенный вами скилл не был найден в бд, попробуйте снова.\n'
                                    'Для выхода - нажмите назад.',
                               chat_id=message.from_user.id)
        return
    updated_skill_list = await db.user_subscriptions.switch_user_skill(user_id=message.from_user.id,
                                                                       skill_id=skill_data['skill_id'])
    await bot.send_message(text='Информация обновлена успешно',
                           chat_id=message.from_user.id,
                           reply_markup=keyboards.users.subscription_menu(updated_skill_list))

