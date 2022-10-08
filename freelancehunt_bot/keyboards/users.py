from aiogram.types import ReplyKeyboardMarkup, KeyboardButton


def main_menu() -> ReplyKeyboardMarkup:
    m = ReplyKeyboardMarkup(resize_keyboard=True, row_width=2)
    m.add(KeyboardButton('Настройка подписок'))
    m.insert(KeyboardButton('Исходный код'))
    m.insert(KeyboardButton('Статистика'))
    return m


def subscription_menu(personal_skill_list) -> ReplyKeyboardMarkup:
    m = ReplyKeyboardMarkup(resize_keyboard=True, row_width=2)
    m.add(KeyboardButton('Назад'))
    for skills in personal_skill_list:
        m.insert(f"✔{skills['skill_name']}" if skills['is_interested'] else f"{skills['skill_name']}")
    return m
