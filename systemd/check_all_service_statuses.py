import os
import subprocess

systemctl_files_path = '/etc/systemd/system'

for file in os.listdir(systemctl_files_path):
    if not file.endswith('.service'):
        continue
    run_service_result = subprocess.run(['systemctl', 'status', file], capture_output=True)
    print(run_service_result.stdout.decode() + run_service_result.stderr.decode())
