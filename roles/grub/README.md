# Ansible Role: `aisbergg.grub`

This is an Ansible role to install and configure the GRUB 2 bootloader on Linux systems.

## Requirements

None.

## Role Variables

| Variable | Default | Comments |
|----------|---------|----------|
| `grub_extra_dependencies` | `[]` | List of extra GRUB dependencies to install (e.g. 'grub-btrfs'). |
| `grub_remove_dependencies` | `['os-prober']` | List of GRUB dependencies to be removed. |
| `grub_config` | `{}` | Dictionary of GRUB configuration variables (key-value pairs). |
| `grub_force_update` | `false` | Force GRUB to update the configuration independent of configuration changes. |

## Dependencies

None.

## Example Playbook

```yaml
- hosts: all
  vars:
    grub_extra_dependencies:
      - grub-btrfs
    grub_config:
      GRUB_TIMEOUT: 5
      GRUB_DISTRIBUTOR: Foo
  roles:
    - aisbergg.grub
```

## License

MIT

## Author Information

Andre Lehmann (aisberg@posteo.de)
