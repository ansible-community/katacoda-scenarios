FIXME Once we are happy with this scenario it will be split into multiple steps.

## Task

Install the `ansible-base` package (which includes `ansible-playbook` and `ansible-test`)

`pip install ansible-base`{{execute}}


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

Create the directory structure so `ansible` and `ansible-test` knows which collection we are using

`mkdir -p ansible_collections/community`{{execute}}

Go into the newly created directory:

`cd ansible_collections/community`{{execute}}

Clone the `community.mysql` repository, notice we are specifying the destination is `mysql` (rather than the default `community.mysql`) to comply with what ansible-test expects:

`git clone https://github.com/ansible-collections/community.mysql.git mysql`{{execute}}

`cd mysql`{{execute}}

`git checkout ci_example`{{execute}}

`ls`{{execute}}

Run sanity tests

`ansible-test sanity --docker`{{execute}}

Run the sanity checks using a docker image and see there is a `parameter-type-not-in-doc` error for the `mysql_user` module (`plugins/modules/mysql_user.py`).

Now add the type for the `append_privs` parameter in the documentation for the by editing file `plugins/modules/mysql_user.py`.

Add a new line between existing 62 & 63 `    type: bool`

Run again the sanity check to ensure the warning disappeared after the modification.
`ansible-test sanity --docker`{{execute}}

Now add a changelog fragment file that describe the change performed, this file that will be included in the changelog file in the next release to provide to users of this collections changes done.

```
cat > changelogs/fragments/mysql_user_docs.yml << EOF
---
minor_changes:
  - mysql_user - fixed the module docs for the mysql_user module
EOF```{{execute}}

Finally add the two files to git staging and commit the modification

```
git add changelogs/fragments/mysql_user_docs.yml plugins/modules/mysql_user.py
git commit -m "Fix mysql_user documentation" .
```{{execute}}

>>Q1: Why do we use the directory structure `ansible_collections/community/mysql` <<
[*] So Ansible knows what the namespace and collection is
[ ] All collections are community

>>Q2: Why do we suggest running tests inside docker <<
[] It's faster
[*] All dependencies are included
[*] Avoids changes to your system
