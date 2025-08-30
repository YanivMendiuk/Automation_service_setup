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

DOCKER_DIR=ansible-shallow-dive/99_misc/setup/docker/
HOST_INI=/home/ansible/ansible_course/hosts.ini
DEBIAN_PLAYBOOK=/home/ansible/ansible_course/playbook_debian.yaml
REDHAT_PLAYBOOK=/home/ansible/ansible_course/playbook_redhat.yaml

cd $DOCKER_DIR

# Start the containers
docker compose up -d
sleep 5

# Accept SSH host keys automatically
docker compose exec ansible-host bash -c '
  for node in node1 node2 node3 node4; do
    ssh-keyscan -H $node >> /home/ansible/.ssh/known_hosts
  done
'

# Run the Ansible playbook directly
docker compose exec -it ansible-host ansible-playbook -i $HOST_INI $DEBIAN_PLAYBOOK
docker compose exec -it ansible-host ansible-playbook -i $HOST_INI $REDHAT_PLAYBOOK