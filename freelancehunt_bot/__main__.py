from aiogram import executor
from freelancehunt_bot.misc import dp
from freelancehunt_bot.db import check_and_create_db

if __name__ == '__main__':
    check_and_create_db.create_data_base()
    executor.start_polling(dp, skip_updates=True)