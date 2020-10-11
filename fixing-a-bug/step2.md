## Create the needed directory structure

When working on Ansible, collections are expected to be under a directory `ansible_collections`.

```
ansible_collections/
├── namespace_1
│   ├── collection_1
│   └── collection_2
├── namespace_2
│   ├── collection_1
│   └── collection_2
├── namespace_3
...
```

For example:
```
ansible_collections/
├── community
│   ├── general
│   ├── mysql
│   └── zabbix
├── ansible
│   └── netcommon
├── vmware
│   └── vmware_rest
├── ...
...
```

## Setup the directory structure

Create the directory structure so `ansible` and `ansible-test` knows which collection we are using.

`mkdir -p ansible_collections/community`{{execute}}

Go into the newly created directory:

`cd ansible_collections/community`{{execute}}

Clone the `community.mysql` repository, notice we are specifying the destination is `mysql` (rather than the default `community.mysql`) to comply with what ansible-test expects:

`git clone https://github.com/ansible-collections/community.mysql.git mysql`{{execute}}

`cd mysql`{{execute}}

`git checkout ci_example`{{execute}}

`ls`{{execute}}

