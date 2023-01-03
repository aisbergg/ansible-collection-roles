# Ansible Role: `aisbergg.systemd_journald`

This role configures the logging service systemd-journald.

## Requirements

Requires Systemd to be used as the service manager.

## Role Variables

| Variable | Default | Comments |
|----------|---------|----------|
| `systemd_journald_config` | `{}` | The configuration for the `journald` service. See man-pages [journald.conf(5)](http://man7.org/linux/man-pages/man5/journald.conf.5.html) for documentation on the available parameters. |
| `systemd_journald_wipe_persistent_storage` | `false` | Wipe the persistent storage directory of Journald. |

## Dependencies

None.

## Example Playbook

```yaml
- hosts: all
  vars:
    systemd_journald_config:
      Storage: persistent
      SystemMaxUse: 100M
  roles:
    - aisbergg.systemd_journald
```

## License

MIT

## Author Information

Andre Lehmann (aisberg@posteo.de)
