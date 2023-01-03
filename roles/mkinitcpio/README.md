# Ansible Role: `aisbergg.mkinitcpio`

This is an Ansible role configures `mkinitcpio` and creates the initial ramdisk on Arch Linux systems.

## Requirements

Requires an Arch Linux system and `mkinitcpio` to be installed.

## Role Variables

| Variable | Default | Comments |
|----------|---------|----------|
| `mkinitcpio_config` | `{}` | Dictionary of MKINITCPIO variables (key-value pairs). A list of available variables and their documentation can be found in [`mkinitcpio.conf(5)`](https://jlk.fjfi.cvut.cz/arch/manpages/man/mkinitcpio.conf.5). |
| `mkinitcpio_force_create` | `false` | Force the creation of the initial ramdisk using `mkinitcpio`. |
| `mkinitcpio_disable_fallback_preset` | `false` | Disable the fallback preset, so only the default preset will be generated. |

## Dependencies

None.

## Example Playbook

```yaml
- hosts: all
  vars:
    mkinitcpio_config:
      MODULES:
        - btrfs
      HOOKS:
        - base
        - udev
        - plymouth
        - autodetect
        - modconf
        - block
        - keyboard
        - keymap
        - plymouth-encrypt
        - filesystems
        - btrfs
      COMPRESSION: lz4
    mkinitcpio_force_create: false
    mkinitcpio_disable_fallback_preset: true
  roles:
    - aisbergg.mkinitcpio
```

## License

MIT

## Author Information

Andre Lehmann (aisberg@posteo.de)
