# Applifting DevOps Task
These resources will create a 3 manager node Docker Swarm, deploy Traefik, Gitlab, Gitlab Runner and whoami services. With resources under *kong-deployment*, you can

## Prerequisites
- Debian-based system is presumed
- Your SSH key being authorized on the hosts
```shell
ssh-copy-id -i ~/.ssh/id_rsa user@host
```

## Step-by-step
1. Run the playbook
```shell
ansible-playbook -K -i ansible/applifting-inventory.yml ansible/main.yml
```
3. Create two Docker secrets
```shell
printf <password> | docker secret create gitlab_root_password -

printf <anotherpassword> | docker secret create kong_postgres_password -
```
3. Deploy the stack with Traefik, Gitlab, Gitlab Runner and whoami
```shell
docker stack deploy -c applifting-deployment/applifting-stack.yml applifting
```
4. Deploy the stack with Kong and whoami
```shell
docker stack deploy -c kong-deployment/kong-stack.yml kong
```
5. If run for first time, run Kong configuration image when *kong_kong* service is running
```shell
docker run --network=kong_kong-net michalkozakgd/applifting-devops-task:8b864d8a
```
6. Register Gitlab Runner
```shell
# Find where is Runner deployed
docker service ps applifting_gitlab-runner

# Exec into it on the correct node
docker exec -it <container_id> gitlab-runner register
```
## Used Gitlab CI/CD build variables
- `KONG_CONSUMER_PASSWORD` for */whoami* basic-auth
- `KONG_PG_PASSWORD` for Kong PostgreSQL password
- `SSH_PRIVATE_KEY` for SSH key to connect to the Docker Swarm
---
Ansible Docker Swarm role is forked from [Jobin James](https://github.com/jobin-james/docker-swarm).