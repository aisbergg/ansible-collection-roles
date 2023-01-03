# Ansible Role: `aisbergg.earlyoom`

This Ansible role installs and configures the [Early OOM Daemon](https://github.com/rfjakob/earlyoom) on Linux systems.

## Requirements

None.

## Role Variables

| Variable | Default | Comments |
|----------|---------|----------|
| `earlyoom_service_state` | `started` | Set the service state (Possible values: started, restarted, stopped) |
| `earlyoom_service_enabled` | `true` | Enable/Disable the Early OOM Daemon. |
| `earlyoom_service_restart_on_change` | `true` | Restart Early OOM daemon service on configuration changes. |
| `earlyoom_config` | `{}` | Configuration options for the Early OOM Daemon. |
| `earlyoom_config.minimum_memory_percent` | `5` | (PERCENT[,KILL_PERCENT]) If the available memory is below this threshold earlyoom will send a SIGTERM, then a SIGKILL once below KILL_PERCENT(default PERCENT/2). |
| `earlyoom_config.minimum_memory_size` |  | (SIZE[,KILL_SIZE]) Set available memory minimum to SIZE KiB. |
| `earlyoom_config.minimum_swap_size` |  | (PERCENT[,KILL_PERCENT]) Set free swap minimum to PERCENT of total. Both memory and swap must be below minimum for earlyoom to act. |
| `earlyoom_config.minimum_swap_percent` |  | (SIZE[,KILL_SIZE]) Set free swap minimum to SIZE KiB. |
| `earlyoom_config.ignore_positive_oom_score_adj_values` | `false` | User-space oom killer should ignore positive oom_score_adj values. |
| `earlyoom_config.notify_send_enabled` | `false` | Enable notifications using "notify-send" |
| `earlyoom_config.notify_command` |  | Enable notifications using COMMAND. |
| `earlyoom_config.memory_report_interval` | `0` | Memory report interval in seconds. |
| `earlyoom_config.lower_niceness` | `false` | Set niceness of earlyoom to -20 and oom_score_adj to -100. |
| `earlyoom_config.avoid_regex` |  | Prefer to kill processes matching REGEX. |
| `earlyoom_config.prefer_regex` |  | Avoid killing processes matching REGEX. |

## Dependencies

None.

## Example Playbook

```yaml
- hosts: all
  vars:
    earlyoom_config:
      earlyoom_config:
      minimum_memory_percent: 5
      minimum_swap_percent: 5
      memory_report_interval: 0
      avoid_regex: '(^|/)(init|sshd|ssh-agent|gnome-.*)$'
  roles:
    - aisbergg.earlyoom
```

## License

MIT

## Author Information

Andre Lehmann (aisberg@posteo.de)
