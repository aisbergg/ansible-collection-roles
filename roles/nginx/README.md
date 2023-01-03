# Ansible Role: `aisbergg.nginx`

This is Ansible role installs and configures [Nginx](https://www.nginx.com) on RedHat, Debian and Arch Linux systems.

## Requirements

None.

## Role Variables

**Bold** variables are required.

| Variable | Default | Comments |
|----------|---------|----------|
| `nginx_redhat_enablerepo` | `""` | Enable a repository for installation on RedHat systems. |
| `nginx_redhat_repo_url` | `http://nginx.org/packages/`<br>`centos/$releasever/$basearch/` | Repository URL for official Nginx releases on RedHat systems. |
| `nginx_debian_default_release` | `""` | Select a default release on Debian systems. |
| `nginx_version` | `""` | Specific version of Nginx to install (must be available in repository). |
| `nginx_extra_packages` | `[]` | Extra packages to install along with Nginx |
| `nginx_service_enabled` | `true` | Enable/Disable the Nginx service |
| `nginx_service_state` | `started` | Service run state (Possible values: started, restarted, stopped) |
| `nginx_service_reload_on_change` | `true` | Reload Nginx service on configuration changes. |
| `nginx_copy_tls_certs` | `[]` | List of TLS certificates to copy |
| **`nginx_copy_tls_certs[].src`** |  | Source path of the certificate file |
| `nginx_copy_tls_certs[].dest` | (certs dir with same name as source file) | Destination path of the certificate file |
| `nginx_copy_tls_keys` | `[]` | List of TLS keys to copy |
| **`nginx_copy_tls_keys[].src`** |  | Source path of the key file |
| `nginx_copy_tls_keys[].dest` | (keys dir with same name as source file) | Destination path of the key file |
| `nginx_copy_tls_pkcs12` | `[]` | List of TLS PKCS12 files to copy and extract |
| **`nginx_copy_tls_pkcs12[].src`** |  | Source path of the PKCS12 file |
| `nginx_copy_tls_pkcs12[].dest` | (keys dir with same name as source file) | Destination path of the PKCS12 file |
| `nginx_copy_tls_pkcs12[].passphrase` |  | Passphrase for certificate extraction |
| `nginx_create_dummy_certificate` | `false` | Create a dummy certificate, that can be used for testing or other purposes. |
| `nginx_remove_unmanaged_configs` | `false` | Remove configurations from conf.d, which are not managed using Ansible |
| `nginx_unmanaged_configs_allowlist` | `[]` | List of file names to exclude when removing unmanaged configs. |
| `nginx_config` | `{}` | Variables (`cfg`) used in the main configuration file ([templates/etc/nginx/nginx.conf.j2](templates/etc/nginx/nginx.conf.j2)) |
| `nginx_vhosts` | `[]` | List of vhost configurations in `/etc/nginx/conf.d` |
| `nginx_other_configs` | `[]` | List other configurations in `/etc/nginx` |
| **`nginx_vhosts[].filename`** |  | Filename for the vhost config |
| `nginx_vhosts[].template` | `vhost.conf.j2` | Template file to use for creating the vhost config (default one: [templates/etc/nginx/conf.d/vhost.conf.j2](templates/etc/nginx/conf.d/vhost.conf.j2)) |
| `nginx_vhosts[].cfg` | `{}` | Variables (`cfg`) used in the vhost template (check out the [default template](templates/etc/nginx/conf.d/vhost.conf.j2) for possible values) |
| `nginx_config_verify` | `true` | Enable config verification |

## Dependencies

The role depends on the following collections:

- `community.general`: for Arch Linux systems only
- `community.crypto`: for creation of certificates and extraction of PKCS12 certificates

## Example Playbook

```yaml
- hosts: all
  vars:
    nginx_service_state: started
    nginx_service_enabled: true

    nginx_copy_tls_pkcs12:
      - src: /path/to/www.pkcs12
        dest: www.pem
        passphrase: s3cr3t

    nginx_config:
      ssl_certificate: "/etc/ssl/private/www.pem"
      ssl_certificate_key: "/etc/ssl/private/www.pem"

    nginx_remove_unmanaged_configs: true
    nginx_vhosts:
      - filename: www.conf
        cfg:
          server_name: www.example.org
          listen:
            - "80"
            - "[::]:80"
            - "443 ssl"
            - "[::]:443 ssl"
          root: /var/www
          index: index.html
          rewrite_https: true
          add_client_caching: true
          locations:
            - match: /
              directives: |-
                try_files $uri $uri/ /index.html;

  roles:
    - aisbergg.nginx
```

## License

MIT

## Author Information

Andre Lehmann (aisberg@posteo.de)
