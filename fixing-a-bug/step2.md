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

For more details on how to create your own Collection and also if you want to know about Collection Data Structure refer the link [here](https://docs.ansible.com/ansible/devel/dev_guide/developing_collections.html).

## Setup the directory structure

Create the directory structure so `ansible` and `ansible-test` know which collection we are using.

`mkdir -p ansible_collections/community`{{execute}}

Go into the newly created directory:

`cd ansible_collections/community`{{execute}}

For this training, we’ll use the existing `community.mysql` collection available on GitHub.

Clone the `community.mysql` repository, notice we are specifying the destination is `mysql` (rather than the default `community.mysql`) to comply with what ansible-test expects:

`git clone https://github.com/ansible-collections/community.mysql.git mysql`{{execute}}

`cd mysql`{{execute}}

Checkout to `ci_example` branch:

`git checkout ci_example`{{execute}}

`ls`{{execute}}
