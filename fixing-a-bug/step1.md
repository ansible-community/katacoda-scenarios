This should be split into multiple steps

## Task

Install ansible-base(so we get ansible-test)

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

Create the directory structure so `ansible` and `ansible-test` knows where what the collection 

`mkdir -p ansible_collections/ansible`{{execute}}
`cd ansible_collections/ansible`{{execute}}

Clone the `ansible.posix` repository, notice we are specifying the destination is posix (rather than the default community.posix) to comply with what expects `ansible`:

`git clone https://github.com/ansible-collections/ansible.posix.git posix`{{execute}}

`cd posix`{{execute}}

`git checkout 06efaeb108775ec339cdb9eee56a3b34b0ffd076`{{execute}}

`ls`{{execute}}

Run the sanity checks using a docker image and see there is a deprecation warning for plugin callback skippy.
`ansible-test sanity --docker`{{execute}}

Now fix the the deprecation by editing file `plugins/callback/skippy.py`.

On line 17 replace `removed_in: '2.11'` by `removed_at_date: 2022-06-01` because `removed_in` is not valid in ansible_collections

Run again the sanity check to ensure the warning disappeared after the modification.
`ansible-test sanity --docker`{{execute}}

Now add a changelog fragment file that describe the change performed, this file that will be included in the changelog file in the next release to provide to users of this collections changes done.

```
cat > changelogs/fragments/skippy_deprecation.yml << EOF
---
minor_changes:
  - skippy - fixed the deprecation warning (by date) for skippy callback plugin
EOF```{{execute}}

Finally add the two files to git staging and commit the modification

```
git add changelogs/fragments/skippy_deprecation.yml plugins/callback/skippy.py
git commit
```{{execute}}

>>Q1: Why do we use the directory structure `ansible_collections/ansible/posix` <<
[*] So Ansible knows what the namespace and collection is
[ ] All collections are community

>>Q2: Why do we suggest running tests inside docker <<
[] It's faster
[*] All dependencies are included
[*] Avoids changes to your system
