Role Name
=========

Install Kitty.

Role Variables
--------------

None

Dependencies
------------

role: install-bashrc

Example Playbook
----------------

```yaml
- name: "install kitty"
  hosts: localhost
  connection: local
  roles:
  - role: install-bashrc
  - role: install-kitty
```

License
-------

Apache-2.0

Author Information
------------------

email: <xavier.balesi@protonmail.ch>
