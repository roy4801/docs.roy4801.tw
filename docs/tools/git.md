# git

## submodule

* Add submodule

```bash
git submodule add
# e.g.
git submodule add git://github.com/majutsushi/tagbar.git .vim/bundle/tagbar
```

* Update submodule

```bash
# `git pull` in each git repo
# or pull all submodules
git submodule foreach --recursive git pull origin master
```

* Delete a submodule

```bash
git rm --cached /path/to/files
rm -rf /path/to/files
```

* Delete the corresponding lines in `.gitmodules`

```
[submodule "/path/to/files"]
    path = /path/to/files
    url = xxx

```

* Clone the repo with submodules

```bash
git clone --recursive <url to the repo>
```

* Clone the reop first and then clone the submodules

```bash
git submodule update --init --recursive
```

## Other

* Clean

```
git config --local credential.helper ""
git push origin master
```

## References

Git Submodule 用法筆記
<https://blog.chh.tw/posts/git-submodule/>
