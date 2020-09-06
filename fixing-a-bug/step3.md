## Run ansible-test

`ansible-test sanity --docker`{{execute}}

Run the sanity checks using a docker image and see there is a `parameter-type-not-in-doc` error for the `mysql_user` module (`plugins/modules/mysql_user.py`).

Now add the type for the `append_privs` parameter in the documentation for the by editing file `plugins/modules/mysql_user.py`.

Add a new line between existing 62 & 63 `    type: bool`

Run again the sanity check to ensure the warning disappeared after the modification.
`ansible-test sanity --docker`{{execute}}

