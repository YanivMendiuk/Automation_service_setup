# 🚀 Automation Service Setup with Ansible

This repository contains Ansible playbooks and supporting scripts to **deploy and manage the `details_app` service** on Linux-based systems.  
The setup ensures that the application runs as a system service (via `systemd` or `init.d`) and is properly configured with dependencies, environment variables, and endpoint validation.  

---

## 📋 Prerequisites

Before running the playbooks, ensure you have:

- Remote **Linux machine/VM** 
- **Docker & Docker Compose** 

---

## ⚙️ Tasks Performed

The Ansible playbooks in this project perform the following:

1. **Access Remote Machine**  
   - Connect to the target Linux VM over SSH.
  
2. **Install packages**
    - 

3. **Deploy Application Sources**  
   - Create a dedicated `details_app` user  
   - Place the application files in `/home/details_app/`  

4. **Install Dependencies**  
   - Install requirements from `requirements.txt` or `pyproject.toml`  

5. **Configure as a Service**  
   - Use a pre-created service file (`systemd`/`init.d`) to configure the app as a service  
   - Enable and start the service  

6. **Verification**  
   - Ensure the service is running  
   - Reboot the machine and confirm persistence of the service  
   - Test the application endpoint remotely  

---

## 📂 Repository Structure

```text
.
├── CONTRIBUTION.md         # Contributors and their roles
├── TASKS.md                # List of tasks and project scope
├── ansible-shallow-dive/   # Ansible examples, playbooks, and misc setup
│   ├── 99_misc/setup/docker/
│   │   ├── docker-compose.yml
│   │   ├── Dockerfile.*    # Various Dockerfiles for testing
│   │   └── example_app/    # Example app with Gunicorn config
│   ├── hosts.ini           # Inventory file
│   ├── playbook_debian.yaml
│   ├── playbook_redhat.yaml
│   └── ...
└── script.sh               # Automation script to install ansible & run playbooks
