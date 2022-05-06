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
