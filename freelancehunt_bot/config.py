from pathlib import Path


MYSQL = {
    'host': '127.0.0.1',
    'user': 'root',
    'password': 'root',
    'db': 'dev_freelancehunt_bot',
}

cwd = Path().cwd()

TOKEN = '56c'

REDIS = {
    'db': 1,
    'prefix': cwd.name
}

WEBHOOK_HOST = 'https://d31b-176-98-89-199.ngrok.io'
WEBHOOK_PATH = 'freelancehunt_notification_bot'
WEBHOOK_URL = f"{WEBHOOK_HOST}/{WEBHOOK_PATH}/"

BOT_SERVER = {
    'host': 'localhost',
    'port': 80
}
