## ansible-test

`ansible-test` is distributed as part of the ``ansible-base`` (and therefore ``ansible``) package.

ansible-test supports three types of tests:
* Sanity
* Unit
* Integration

These tests are run automatically when you create a Pull Request (PR). We can, and should run them locally before before commit code.

For this example we will be running the Sanity Tests, by doing:

`ansible-test sanity --docker`{{execute}}

We prefer to run the tests in Docker as it ensure all test dependencies are installed, and nothing pollutes the host operating system.

From the output of ansible-test, see there is a `parameter-type-not-in-doc` error for the `mysql_user` module (`plugins/modules/mysql_user.py`).

### Fix mysql_user.py

Now add the type for the `append_privs` parameter in the documentation for the by editing file `plugins/modules/mysql_user.py`.

`ansible_collections/community/mysql/plugins/modules/mysql_user.py`{{open}}

We can see from line 1004 in that file `append_privs=dict(type='bool', default=False),`, so the documentation should say this is a `bool` (boolean).

Add a new line between existing 62 & 63 `    type: bool` so the entry looks like:
```yaml
  append_privs:
    description:
      - Append the privileges defined by priv to the existing ones for this
        user instead of overwriting existing ones.
    default: no
    type: bool
```

Once you've added the line, click the `x` on the top of the file name to edit the editor and save `mysql_user.py`

### Validate the fix

Run again the sanity check to ensure the warning disappeared after the modification.
`ansible-test sanity --docker`{{execute}}

You can also run sanity tests on a specific file to make it faster.
`ansible-test sanity plugins/modules/mysql_user.py --docker`{{execute}}

If the test fails, reopen the file with the above command
