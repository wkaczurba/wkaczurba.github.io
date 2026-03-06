# GIT random notes

- [GIT random notes](#git-random-notes)
  - [Git rebase, merge, etc. - from shell.](#git-rebase-merge-etc---from-shell)
  - [Dropping all local commits + reset to whatever on origin](#dropping-all-local-commits--reset-to-whatever-on-origin)


## Git rebase, merge, etc. - from shell.

```sh
git rebase master
git push --force-with-leash
```

## Dropping all local commits + reset to whatever on origin
```
git reset --hard origin/whatever-branch
```

Dropping all local commits -> to head on local
```
git reset --hard HEAD
```

