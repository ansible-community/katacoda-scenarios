## Create a changelog fragment

Now add a changelog fragment file that describes the change performed, this file that will be included in the changelog file in the next release to provide to users of this collections changes done.

```
cat > changelogs/fragments/mysql_user_docs.yml << EOF
---
minor_changes:
  - mysql_user - fixed the module docs for the mysql_user module
EOF```{{execute}}

Finally, add the two files to git staging and commit the modification

```
git add changelogs/fragments/mysql_user_docs.yml plugins/modules/mysql_user.py
git commit -m "Fix mysql_user documentation" .
```{{execute}}

More details regarding changelog fragments can be found in the [documentation](https://docs.ansible.com/ansible/latest/community/development_process.html#changelogs).
