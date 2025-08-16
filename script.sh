#!/usr/bin/env bash
# -----------------------------------------------------
# Script Name:    script.sh
# Version:        1.1.0
# Author:         Yaniv Mendiuk
# Date:           2025-08-15
# Description:
# This script automates installation of ansible and running the playbook.

set -o errexit
set -o pipefail
# -----------------------------------------------------

cd ansible-shallow-dive/99_misc/setup/docker/

# Start the containers
docker compose up -d
sleep 5

# Connect to ansible-host
# docker compose exec -it ansible-host bash

# Accept SSH host keys automatically
docker compose exec ansible-host bash -c '
  for node in node1 node2 node3 node4; do
    ssh-keyscan -H $node >> /home/ansible/.ssh/known_hosts
  done
'

# Ensure private key permissions are correct
# chmod 400 /root/.ssh/id_rsa

# Run the Ansible playbook directly
docker compose exec -it ansible-host ansible-playbook -i /home/ansible/ansible_course/hosts.ini /home/ansible/ansible_course/playbook.yaml
dsad
