Role Name
=========

Install i3wm and its config.

Requirements
------------

ubuntu with apt.

Role Variables
--------------

| variable | definition | default value |
|---|---|---|
| `i3wm_keyring_url` | url of i3wm keyring deb | `https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2023.02.18_all.deb` |

Dependencies
------------

None.

Example Playbook
----------------

```yaml
- name: "install i3wm"
  hosts: localhost
  connection: local
  roles:
  - role: install-i3wm
```

License
-------

Apache-2.0

Author Information
------------------

email: xavier.balesi@protonmail.ch
