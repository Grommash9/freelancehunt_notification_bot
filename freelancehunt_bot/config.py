from pathlib import Path

MYSQL = {
    'host': '127.0.0.1',
    'user': 'root',
    'password': 'root',
    'db': '',
}

cwd = Path().cwd()

TOKEN = '5314432212:AAF51gh1IbmXolssng1cfijhtcDI9dzMezY'

REDIS = {
    'db': 1,
    'prefix': cwd.name
}

WEBHOOK_HOST = 'https://7177-176-98-92-37.eu.ngrok.io'
WEBHOOK_PATH = 'path/to/api'
WEBHOOK_URL = f"{WEBHOOK_HOST}/{WEBHOOK_PATH}/"

BOT_SERVER = {
    'host': 'localhost',
    'port': 80
}
