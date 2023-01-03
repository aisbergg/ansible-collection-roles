# Ansible Collection: `aisbergg.roles`

A collection of various Ansible Roles for Debian, RedHat and Arch Linux systems.

## Installation

Install the collection manually
```shell
ansible-galaxy collection install aisbergg.roles
```

or specify the collection in `requirements.yml`:

```yaml
---
collections:
  - name: aisbergg.roles
```

## Usage

Documentation for each role can be found in the respective README.md file of each role.

## Example Playbook

```yaml
- hosts: all
  roles:
    - role: aisbergg.roles.zfs
    - role: aisbergg.roles.docker
    - role: aisbergg.roles.nginx
```

## License

MIT

## Author Information

Andre Lehmann (aisberg@posteo.de)
