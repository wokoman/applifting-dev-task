# Applifting DevOps Task
These resources will create a 3 manager node Docker Swarm, deploy Traefik, Gitlab, Gitlab Runner and whoami services. With resources under *kong-deployment*, you can

## Prerequisites
- Debian-based system is presumed
- Your SSH key being authorized on the hosts
```console
ssh-copy-id -i ~/.ssh/id_rsa user@host
```

## Step-by-step
1. Amend inventory to your IP hosts, user and private key location
2. Run the playbook
```console
ansible-playbook -K -i ansible/applifting-inventory.yml ansible/main.yml
```

Ansible Docker Swarm role is forked from [Jobin James](https://github.com/jobin-james/docker-swarm).