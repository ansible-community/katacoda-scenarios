## Install ansible-base

To use Ansible we need to have it installed. This will also install any required dependencies.

Install the `ansible-base` package (which includes `ansible-playbook` and `ansible-test`)

`pip install --user ansible-base`{{execute}}

Ansible 2.10 is the first version of Ansible that properly supports Collections. We can check the installed version by running:

`ansible --version`{{execute}}

The output will look similar to the following:

```
ansible 2.10.1
  config file = /etc/ansible/ansible.cfg
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/lib/python3.8/dist-packages/ansible
  executable location = /usr/local/bin/ansible
  python version = 3.8.4 (default, Jul 13 2020, 23:52:41) [GCC 7.5.0]
```

Take note of the first line which confirms we are using at least version 2.10, or higher.
