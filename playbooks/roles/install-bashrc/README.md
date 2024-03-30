install-bashrc
=========

Install base .bashrc.d directory with auto load `*.bashrc` files in `auto` sub directories.
A function enable to load files in `~/.bashrc.d/**/spec` directory.

Requirements
------------

- bash

Role Variables
--------------

| variable | definition | default value |
|---|---|---|
| `bashrcd_dir` | bashrc scripts directory | `{{ ansible_env.HOME }}/.bashrc.d` |
| `bashrcd_global_dir` | bashrc global scripts directory | `{{ ansible_env.HOME }}/.bashrc.d/global` |
| `bashrcd_auto_dir` | auto load directory | `auto` |
| `bashrcd_load_dir` | manual load directory | `load` |

Example Playbook
----------------

```yaml
- name: "install bashrc"
  hosts: localhost
  connection: local
  roles:
  - role: install-bashrc
```

License
-------

Apache-2.0

Author Information
------------------

email: <xavier.balesi@protonmail.ch>
