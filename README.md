# Homelab Playbooks

A collection of Ansible playbooks for managing my homelab using [these Ansible roles](https://github.com/gillwong/homelab-collection).

## Configure all VMs

```bash
ansible-playbook homelab_base.yaml
ansible-playbook nvidia.yaml
```

## Configure GitLab Runner

```bash
ansible-playbook gitlab_runner.yaml
```

## Configure Kubernetes Cluster

```bash
ansible-playbook k8s_prepare.yaml
ansible-playbook k8s_create.yaml
```
