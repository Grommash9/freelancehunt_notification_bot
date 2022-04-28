from pathlib import Path

MYSQL = {
    'host': '127.0.0.1',
    'user': 'root',
    'password': 'root',
    'db': '',
}


cwd = Path().cwd()



TOKEN = '5228586814:AAH8_CqqJcue71jYGSKNksmGPyoFkDOOU7s'

REDIS = {
    'db': 1,
    'prefix': cwd.name
}