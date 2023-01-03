# Ansible Role: `aisbergg.sysctl`

This Ansible role configures the Linux kernel parameters.

## Requirements

None.

## Role parameters

| Variable | Default | Comments |
|----------|---------|----------|
| `sysctl_conf` | `{}` | Dictionary of kernel parameters (key-value pairs) to save into `/etc/sysctl.conf` |
| `sysctl_d_clear` | `false` | Remove any left over configuration files from `/etc/sysctl.d/`, that are not defined using this role. |
| `sysctl_d_clear_whitelist` | `[]` | When using `sysctl_d_clear` the files listed on the whitelist will not be deleted. |
| `sysctl_d` | `[]` | List of kernel configuration files to go in `/etc/sysctl.d/` |
| `sysctl_d.file`</br>_required_ |  | File name (without extension) |
| `sysctl_d.order` | `00` | File order as a two-digit number |
| `sysctl_d.parameters` | `{}` | Dictionary of kernel parameters (key-value pairs) |

## Example Playbook

```yaml
- hosts: all
  vars:
    sysctl_conf:
      vm.dirty_ratio: 20
      vm.dirty_background_ratio: 15
    sysctl_d_clear: true
    sysctl_d_clear_whitelist:
      - "99-foo.conf"
    sysctl_d:
      # creates a file '10-network.conf'
      - file: network
        order: 10
        parameters:
          net.ipv4.tcp_syncookies: true
          net.ipv4.ip_forward: false
      # creates a file '20-security.conf'
      - file: security
        order: 20
        parameters:
          kernel.dmesg_restrict: true
  roles:
    - aisbergg.sysctl
```

## License

MIT

## Author Information

Andre Lehmann (aisberg@posteo.de)
