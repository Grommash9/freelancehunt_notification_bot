import os
import subprocess
from os.path import dirname, abspath

parent_path = dirname(dirname(abspath(__file__)))

repository_name = os.path.basename(dirname(dirname(abspath(__file__))))


def restart(cur_file_name):
    sys_reload_result = subprocess.run(['systemctl', 'daemon-reload'], capture_output=True)
    print(sys_reload_result.stdout.decode() + sys_reload_result.stderr.decode())
    for commands in ['restart', 'status']:
        run_service_result = subprocess.run(['systemctl', commands, f"{cur_file_name}.service"], capture_output=True)
        print(run_service_result.stdout.decode() + run_service_result.stderr.decode())
    print(f"{cur_file_name} restart done")


for package in os.listdir(parent_path):
    if os.path.isdir(os.path.join(parent_path, package)) and os.path.exists(os.path.join(parent_path, package, '__main__.py')):
        if package == 'bot_app':
            file_name = repository_name
        elif package == f"api_application":
            file_name = f"{repository_name}_api"
        else:
            file_name = f"{repository_name}_{package}"
        restart(file_name)
    if os.path.isdir(os.path.join(parent_path, package)) and os.path.exists(
        os.path.join(parent_path, package, 'manage.py')):
            file_name = f'gunicorn_{package}_{repository_name}'
            restart(file_name)



