# Homelab Playbooks

A collection of Ansible playbooks for managing my homelab using [these Ansible roles](https://github.com/gillwong/homelab-collection).

## Installation

1. Ensure you have [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html) and the `ansible-galaxy` CLI installed on your control node.
2. Install the required Ansible collection:
   ```bash
   ansible-galaxy collection install gillwong.homelab
   # or, if using the local collection:
   ansible-galaxy collection install -r requirements.yaml
   ```

## Setup

1. Edit the files in the `inventory/` directory (e.g., `k8s.yaml`, `pve.yaml`, `other.yaml`) to match your environment (by default, Ansible uses this directory as the inventory). Example:
   ```yaml
   k8s_control_plane:
     hosts:
       k8s-cp-1:
         ansible_host: 192.168.0.131
       # ...
   ```
2. Edit group variables in `group_vars/` and host variables in `host_vars/` as needed. Example:
   ```yaml
   # group_vars/all/vars.yaml
   download_dir: ~/downloads/k8s_ansible
   ```
3. Delete any example/encrypted vault files in this repo before starting.
4. Create your own vault files for secrets (e.g., `vault.yaml`).
5. Store your vault password securely:
   - On macOS: Save your vault password in Keychain Access.
   - On Linux: Use `pass` (the standard unix password manager).
6. Encrypt your vault files (by default, Ansible will use the `get-vault-password.sh` script to retrieve the password from your keychain or pass store):
   ```bash
   ansible-vault encrypt group_vars/<group>/vault.yaml
   ansible-vault encrypt host_vars/<host>/vault.yaml
   ```

## Usage

### Configure Proxmox Virtual Environment Nodes

```bash
ansible-playbook pve.yaml
```

### Configure all VMs

```bash
ansible-playbook homelab_base.yaml
ansible-playbook nvidia.yaml
```

### Configure GitLab Runner

```bash
ansible-playbook gitlab_runner.yaml
```

### Create VMs for Kubernetes Cluster

```bash
ansible-playbook k8s_vm_create.yaml
```

Then, inside the last VM (by default 192.168.0.137), wait for cloud-init to finish:

```bash
sudo cloud-init status --wait
```

Then, shutdown all VMs and start them manually to apply TPM configuration for UEFI:

```bash
ansible-playbook k8s_vm_shutdown.yaml
```

### Configure Kubernetes Cluster

```bash
ansible-playbook k8s_prepare.yaml
ansible-playbook k8s_create.yaml
```

### Install Flux

```bash
ansible-playbook flux.yaml
```
