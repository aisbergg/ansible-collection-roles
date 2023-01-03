# Ansible Role: `aisbergg.certificates`

This is Ansible role handles copying TLS certificates and keys on RedHat and Debian systems.

## Requirements

None.

## Role Variables

**Bold** variables are required.

| Variable | Default | Comments |
|----------|---------|----------|

## Dependencies

None.

## Example Playbook

```yaml
- hosts: all
  vars:
    certificates_certs:
      # copy file
      - file: path/to/cert.pem
        dest: my-cert.pem
        handler: restart nginx
        state: present

      # copy file content
      - content: |
          xxx
        dest: my-cert2.pem
        state: present

      # download file
      - url: https://example.org/path/to/cert.pem
        dest: my-cert3.pem
        state: present

    certificates_keys: []

    certificates_ca_certs: []

    certificates_pkcs12: []

    certificates_create: []

  roles:
    - aisbergg.certificates
```

## License

MIT

## Author Information

Andre Lehmann (aisberg@posteo.de)
