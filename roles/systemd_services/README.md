# Ansible Role: `aisbergg.systemd_services`

This Ansible role is a simple wrapper around the `systemd` module for managing existing Systemd units.

## Requirements

- System needs to be managed with Systemd

## Dependencies

None

## Role Variables

| Variable | Default | Comments |
|----------|---------|----------|
| `systemd_services` | `[]` | List of systemd services. The parameters are the same as the parameters of the [`systemd` Ansible module](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/systemd_module.html). |

## Example Playbook

```yaml
- hosts: all
  vars:
    systemd_services:
      - state: started
        name: httpd

  roles:
    - role: aisbergg.systemd_services
```

## License

MIT

## Author Information

Andre Lehmann (aisberg@posteo.de)
