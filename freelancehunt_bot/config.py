from pathlib import Path


MYSQL = {
    'host': '127.0.0.1',
    'user': 'root',
    'password': 'root',
    'db': 'root',
}

cwd = Path().cwd()

TOKEN = '5314432212:'

REDIS = {
    'db': 1,
    'prefix': cwd.name
}

WEBHOOK_HOST = 'https://7177-176-98-92-37.eu.ngrok.io'
WEBHOOK_PATH = 'freelancehunt_notification_bot'
WEBHOOK_URL = f"{WEBHOOK_HOST}/{WEBHOOK_PATH}/"

BOT_SERVER = {
    'host': 'localhost',
    'port': 80
}
