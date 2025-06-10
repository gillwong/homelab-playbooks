# Homelab Playbooks

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
ansible-playbook k8s_cluster.yaml
```
