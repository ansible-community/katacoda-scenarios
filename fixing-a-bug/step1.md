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
│   ├── posix
│   └── netcommon
├── vmware
│   └── vmware_rest
├── ...
...
```

Create the directory structure so `ansible` and `ansible-test` knows which collection we are using

`mkdir -p ansible_collections/ansible`{{execute}}
`cd ansible_collections/ansible`{{execute}}

Clone the `ansible.posix` repository, notice we are specifying the destination is `posix` (rather than the default `community.posix`) to comply with what expects `ansible`:

`git clone https://github.com/ansible-collections/ansible.posix.git posix`{{execute}}

`cd posix`{{execute}}

`git checkout ci_example`{{execute}}

`ls`{{execute}}

Run the sanity checks using a docker image and see there is a `parameter-type-not-in-doc` error for the acl module (`plugins/modules/acl.py`).
`ansible-test sanity --docker`{{execute}}

Now add the type for the `use_nfsv4_acls` parameter in the documentation for the by editing file `plugins/modules/acl.py`.
w
Add a new line between existing 74 & 75 `    type: bool`

Run again the sanity check to ensure the warning disappeared after the modification.
`ansible-test sanity --docker`{{execute}}

Now add a changelog fragment file that describe the change performed, this file that will be included in the changelog file in the next release to provide to users of this collections changes done.

```
cat > changelogs/fragments/acl_docs.yml << EOF
---
minor_changes:
  - acl - fixed the module docs for the acl module
EOF```{{execute}}

Finally add the two files to git staging and commit the modification

```
git add changelogs/fragments/acl_docs.yml plugins/modules/aci.py
git commit
```{{execute}}

>>Q1: Why do we use the directory structure `ansible_collections/ansible/posix` <<
[*] So Ansible knows what the namespace and collection is
[ ] All collections are community

>>Q2: Why do we suggest running tests inside docker <<
[] It's faster
[*] All dependencies are included
[*] Avoids changes to your system
