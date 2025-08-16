#!/bin/bash
set -euo pipefail

# Variables
DOCKER_DIR="ansible-shallow-dive/99_misc/setup/docker"
ANSIBLE_CONTAINER="ansible-host"
ANSIBLE_PLAYBOOK="/ansible/playbook.yaml"
ANSIBLE_INVENTORY="/ansible/hosts.ini"
NODES=(node1 node2 node3 node4)

# Move to Docker setup directory
cd "$DOCKER_DIR"

echo "[INFO] Starting Docker containers..."
docker compose up -d

echo "[INFO] Waiting for containers to be ready..."
sleep 5

echo "[INFO] Adding SSH host keys for nodes..."
for node in "${NODES[@]}"; do
    docker compose exec "$ANSIBLE_CONTAINER" ssh-keyscan -H "$node" >> ~/.ssh/known_hosts 2>/dev/null
done

echo "[INFO] Setting correct permissions for private key..."
docker compose exec "$ANSIBLE_CONTAINER" chmod 400 /root/.ssh/id_rsa

echo "[INFO] Running Ansible playbook..."
docker compose exec "$ANSIBLE_CONTAINER" ansible-playbook -i "$ANSIBLE_INVENTORY" "$ANSIBLE_PLAYBOOK"

echo "[SUCCESS] Ansible playbook completed successfully."

