# VM definition

- `name`
    - The name of the VM. This should be a string, preferably human readable.

- `cores`
    - The number of CPU cores to assign to the VM. This should be a positive integer.
    - Example: `2`, `4`

- `memory`
    - The amount of memory to assing to the VM, in MiB.
    - Example: `512`, `2048`, `4096`

- `storage`
    - The name of the primary storage space that will be used for the VM. Note that storage can be set individually for disks, drives, etc.

- `network_devices`
    - Dictionary containing the network device configuration, where the key is the device ID (`net0`, `net1`, ...) and the value can contain:
        - `type` - the type of the network device, by default `virtio`
        - `mac` - the MAC address of the network device. A random one is generated if not provided. Changing the type of the device will also regenerate the MAC address.
        - `bridge` - the network bridge defined in Proxmox the device should connect, by default `vmbr0`
        - `firewall` - a toggle to enable/disable the firewall for this device, enabled by default
        - `vlan_tag` - a VLAN tag to use for this device, by default no VLAN tag is used

- `disks`
    - Dictionary containing the disk configuration, where the key is the device ID (`scsi0`, `scsi1`, ...) and the value can contain:
        - `size` - the size of the disk in GiB - if the disk is smaller than the requested size, the disk will be resized. This is required, and has no default. Note: A disk can not be resized to a smaller size, doing so will result in errors.
        - `storage` - the storage name for the disk to be created on. Defaults to the VM storage.
    - Note: The device IDs can also be SATA (`sata0`, ) or IDE, but the recommendation is to use SCSI for VM disks.

- ``