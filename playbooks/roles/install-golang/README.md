Role Name
=========

Install golang.

Requirements
------------

ubuntu with apt.

Role Variables
--------------

| variable | definition | default value |
|---|---|---|
| `golang_version` | golang version | `1.21.4` |

Dependencies
------------

install_bashrc.yaml

Example Playbook
----------------

```yaml
- name: "install golang"
  hosts: localhost
  connection: local
  roles:
  - role: install-golang
```

License
-------

Apache-2.0

Author Information
------------------

email: xavier.balesi@protonmail.ch
