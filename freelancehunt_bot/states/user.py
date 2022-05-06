from aiogram.dispatcher.filters.state import StatesGroup, State


class User(StatesGroup):
    main = State()

    class NewSkills(StatesGroup):
        skill_name = State()

