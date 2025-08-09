I want to run a command to docker compose to 99_ this will start the workers and the ansible host
Then I want to login the ansible host 
Then I want to run a playbook that will copy the git clone or better clone directly from the wroker

cd ansible-shallow-dive/99_misc/setup/docker/
docker compose up -d
sleep 5
docker compose exec -it ansible-host bash

chmod 400 ~/.ssh/id_rsa

# Need to handle somehow the finger print for each node - ssh docker@node1 -y

# Need to run the playbook ansible-playbook -i hosts.ini playbook.yaml
