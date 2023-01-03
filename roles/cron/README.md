# Ansible Role: `aisbergg.cron`

This Ansible role installs Cronie and configures Cron Jobs.

## Requirements

None.

## Role Variables

| Variable | Default | Comments |
|----------|---------|----------|
| `cron_jobs` | `[]` | List of cron jobs. The parameters are the same as the parameters of the [cron Ansible module](https://docs.ansible.com/ansible/latest/modules/cron_module.html). |
| `cron_service_enabled` | `true` | Service enabled on boot |
| `cron_service_state` | `started` | Service run state (`started`, `stopped`, `restarted`) |

## Dependencies

None.

## Example Playbook

```yaml
- hosts: all
  vars:
    cron_jobs:
      - name: "check dirs"
        minute: "0"
        hour: "5,2"
        job: "ls -alh > /dev/null"
      
      # remove an old job
      - name: "an old job"
        state: absent
  roles:
    - role: cron
```

## License

MIT

## Author Information

Andre Lehmann (aisberg@posteo.de)
