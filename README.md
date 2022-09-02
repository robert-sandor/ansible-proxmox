# Proxmox setup playbooks

These playbooks setup proxmox the way I use it, together with VM templates, containers and VMs. 
These playbooks are tailored to my needs in the first place, so many proxmox features are unsupported, as I do not use them.
Feel free to propose changes for new features in the Issues section.

# Prerequisites

You should have [Ansible](https://github.com/ansible/ansible) installed on a the system that will run the playbook.

To install the prerequisites, run `ansible-galaxy install -r requirements.yml`.

# Setting up the inventory

Make a copy of the `inventories/sample` directory, and give it a representative name.
Modify the `hosts.yml` file in the inventory, and add your Proxmox host.
For best results, make sure you have your public key set on the Proxmox host for authentication, using `ssh-copy-id proxmox-host`. For more info on setting up an inventory file, check out the documentation from Ansible [here](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html).

Modify the `host_vars` and `group_vars` files according to your desired setup. For a full list of available vars, check the documentation [here](docs/variables.md).

# Running the playbook

Once the inventory and variables are setup, run the playbook using `ansible-playbook playbooks/setup.yml -i inventories/<name>/hosts.ym;`.
You can add `--ask-ssh-pass` / `-k` if you don't have a public ssh key setup on the proxmox host, and `--ask-pass` / `-K` if running with a non-root user.

The playbook also supports ansible tags, which can be used to run parts of the playbook only. 
The current available tags are:
- `setup` - runs only the setup part of the playbook
- `templates` - creates VM templates from cloud-init-ready images
- `storage` - downloads ISOs and CT templates
- `vms` - creates and updates the configuration for VMs
- `containers` - creates and updates the configuration for containers
