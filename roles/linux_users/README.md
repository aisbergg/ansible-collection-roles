# Ansible Role: `aisbergg.linux_users`

This Ansible role manages Linux users and groups. The role supports all relevant options of the Ansible [user](https://docs.ansible.com/ansible/latest/modules/user_module.html) and [group](https://docs.ansible.com/ansible/latest/modules/group_module.html) module. In addition it allows to manage the users SSH authorized keys and also allows to pass in passwords as plain text.

## Requirements

If you want to pass plaintext passwords to the `user` module, you need to have the Python package `passlib` installed.

## Role Variables

| Variable | Default | Comments |
|----------|---------|----------|
| `linux_users` | `[]` | List of users to be present or absent on the system. The options are the same as the options of the [user](https://docs.ansible.com/ansible/latest/modules/user_module.html) module. The role provides also the options `plain_password` and `authorized_key`. The latter one can either be a string or a mapping as used by the [`authorized_key`](https://docs.ansible.com/ansible/latest/modules/authorized_key_module.html) module. |
| `linux_groups` | `[]` | List of groups to be present or absent on the system. The options are the same as the options of the [group](https://docs.ansible.com/ansible/latest/modules/group_module.html) module. |
| `linux_users_hash_scheme` | `sha512` | The scheme used for hashing passwords, if passwords are passed in plain-text using the `plain_password` option. |
| `linux_users_hash_rounds` | `29000` | Rounds of hashing to be applied to plain-text passwords. |

## Example Playbook

```yaml
- hosts: all
  vars:
    linux_users:
      - name: foo
        plain_password: "foobar"
        groups: sudo
        authorized_key: ssh-ed25519 AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
        shell: /bin/zsh
        state: present

      - name: bar
        state: absent
        remove: true

      - name: yay
        uid: 991
        comment: "User for building and installing packages with YAY"
        shell: "/bin/bash"
        system: yes
        state: present

    linux_groups:
      - name: webteam
        state: present
        gid: 10000

      - name: nginx
        state: absent

  roles:
    - aisbergg.linux_users
```

## License

MIT

## Author Information

Andre Lehmann (aisberg@posteo.de)
