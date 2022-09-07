# Variables

## Defaults

For a complete list of default variables, you can check [defaults/main.yml](../roles/proxmox/defaults/main.yml) file.

## Setup

- `domain` 
    - This is the domain that will be used for ACME configuration. It should be the same as the domain set on the Proxmox host at install.
    - Example: `domain.com`

- `switch_to_community_updates_repo`
    - Whether to switch to the community repository, instead of using the `pve-enterprise` repository for updates. This is recommended unless you have a Proxmox subscription.

- `disable_no_subscription_prompt`
    - Whether to remove the (frankly annoying) "No subscription" prompt that is shown when the Proxmox subscription is missing. This is recommended for sanity, unless you have a Proxmox subscription.

- `install_pve_discord_dark_theme`
    - Whether to install the excellent [PVEDiscordDark](https://github.com/Weilbyte/PVEDiscordDark) theme.

- `enable_acme`
    - A toggle for enabling automatic cetificate management using ACME.

- `acme_email`
    - The email address which will be used to register in the ACME system. Notifications regarding certificat expiration will be sent to this email address.
    - Example: `john.smith@gmail.com`, `admin@domain.com`

- `acme_staging`
    - Toggle for choosing the Staging or Production servers from ACME. Staging is useful for testing purposes.

- `acme_plugin_name`
    - The name of the ACME plugin to use for the ACME challenge. List of supported plugins are:
        - [Cloudflare DNS](./cloudflare_dns.md)
    - Proxmox supports many more ACME plugins, and as support is added for those, the list here will grow.
    - Examples: `cloudflare`

- `install_nginx_proxy`
    - Whether to install NGINX as a reverse proxy, to allow accessing the Proxmox interface on `https://<hostname>.<domain>` URL.

- `ssh_keys`
    - This is not a required variable, but it can be used to store the SSH public keys that will be added to VMs / containers.

- `managed_by_ansible_tag`
    - A tag that will be applied to all VMs and containers created by this playbook, mainly used when checking whether to remove a VM or container.

- `vm_iso_remove_unreferenced`
    - Whether to remove ISO files that are not referenced in the variables.

- `ct_template_remove_unreferenced`
    - Whether to remove CT templates that are not referenced in the variables.

- `vm_remove_unreferenced`
    - Whether to remove VMs that are not referenced in the variables, and are marked using the `managed_by_ansible_tag`.

- `container_remove_unreferenced`
    - Whether to remove containers that are not referenced in the variables, and are marked using the `managed_by_ansible_tag`.

## Storage - `storage`

A dictionary containing the storage configurations. The key is the name of the storage, and the value is a dictionary containing:
- `isos` - A list of URLs to download ISO images from.
- `ct_templates` - A list of CT templates to download. To get the available CT templates from Proxmox, run the `list_ct_images.yml` playbook.

**Note**: The playbook will also remove already existing container images

## Templates - `templates`

A dictionary containing the VM template definitions, where:
- The key is a unique integer, that will become the `vmid` of the template
- The configuration consisting of
    - `name` - A name to set for the Template. Example: `ubuntu-2204`
    - `cloud_image_url` - A link to the cloud image that will be used to create the template. Some useful links for this:
        - [Ubuntu cloud images](https://cloud-images.ubuntu.com/)
        - [Debian cloud images](https://cloud.debian.org/images/cloud/)
    - `storage` - The name of the Proxmox storage where the template should be created.

## VMs - `vms`

A dictionary containing the VM definitions.
The key is going to be the `vmid` of the created VM, and the value is a dictionary comprising the [VM definition](vm_variables.md).