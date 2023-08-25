python-install
=========

Install python stuffs like pyenv, pdm, etc.

Requirements
------------

Python 3 is already installed.

Role Variables
--------------

| variable | definition | default value |
|---|---|---|
| `python_version` | version to set by default in pyenv | `3.10.7` |
| `pyenv_root` | pyenv location | `~/.pyenv` |

Dependencies
------------

None.

Example Playbook
----------------

```yaml
- name: "install python and cie"
  hosts: localhost
  connection: local
  roles:
  - role: install-python
    python_version: 3.10.7
    pyenv_root: ~/.pyenv
```

License
-------

Apache-2.0

Author Information
------------------

email: xavier.balesi@protonmail.ch
