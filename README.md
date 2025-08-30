# Automation Service Setup

[![Author](https://img.shields.io/badge/author-Yaniv%20Mendiuk-blue)]()

## Table of Contents

- [Project Overview](#project-overview)
- [Directory Structure](#directory-structure)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Ansible Playbooks](#ansible-playbooks)
- [Contributing](#contributing)
- [License](#license)

---

## Project Overview

This repository contains an **Ansible-based automation framework** for deploying and running the `detailsapp` application on Linux-based systems. The project supports both **Debian** and **RedHat** hosts and handles:

- User creation and permissions
- Package installation
- Python environment setup
- Application deployment via Git
- Running automation scripts
- Starting the application using Gunicorn
- Endpoint health checks

The automation can be executed locally in Docker containers for testing or directly on remote servers.

---

## Directory Structure

.
├── CONTRIBUTION.md
├── README.md
├── TASKS.md
├── ansible-shallow-dive
│ ├── 99_misc
│ │ ├── Task.md
│ │ ├── darkslide_5.1.0-1_all.deb
│ │ └── setup
│ │ ├── docker
│ │ │ ├── Dockerfile.alpine
│ │ │ ├── Dockerfile.ansible
│ │ │ ├── Dockerfile.app
│ │ │ ├── Dockerfile.deb
│ │ │ ├── Dockerfile.rpm
│ │ │ ├── READTHIS.md
│ │ │ ├── docker-compose.yml
│ │ │ └── example_app/
│ │ ├── k3s/setup.sh
│ │ └── vagrant/Vagrantfile
│ ├── Dockerfile
│ ├── backup_playbook.yaml
│ ├── build.sh
│ ├── generate.sh
│ ├── hosts.ini
│ ├── playbook_debian.yaml
│ ├── playbook_redhat.yaml
│ └── spell.txt
└── script.sh

---

## Prerequisites

Ensure the following tools are installed on your local machine:

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
- Git
- Bash shell

---

## Installation

Clone this repository:

```bash
git clone https://github.com/YanivMendiuk/Automation_service_setup.git
cd Automation_service_setup
```

## Usage

The main automation script script.sh handles:

1. Starting the Docker containers

2. Adding SSH keys for nodes

3. Running Ansible playbooks for both Debian and RedHat systems

```bash
chmod +x script.sh
./script.sh
```
