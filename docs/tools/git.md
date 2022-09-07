# git

## Remove from git but keep local

```
# Added but not commited
git reset

# Commited
git rm --cached {someFile}
git rm --cached -r {someDir}
```

## Edit a commit

- autosquash

```bash
git commit -m "fixup! <msg/hash>"
git rebase <hash>~N -i --autosquash
```

## Reset

![](https://i.imgur.com/mAwTMCd.png)

- Hard
    - 直接回到該 commit

```bash=
git reset --hard <HEAD/hash>~N # 回到前 N 個
```

- Soft

```bash=
git reset --soft <hash>
```

## Quick fix the last commit

```bash
git commit --amend --no-edit
```

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

## pull

- rebase
```bash linenums="1"
git pull --rebase
git rebase --continue
```

## cherry-pick

Pick a specific commit to HEAD

```bash=
git cherry-pick <SHA1> <SHA2> ...
```

- Conflict?
    - `git cherry-pick --continue`

- Edit commit message? Use `-e`
    - `git cherry-pick <sha> -e`

## Revert

已經被推上去的 commit 發現錯誤，可以用 revert 來修復

```bash=
git revert <Hash>
```

## reflog - 移動紀錄

- HEAD log
    ```bash=
    git reflog
    ```

- branch log
    ```bash=
    git reflog <branch>
    ```

## Search commit

```bash=
git log --grep "<pattern>"
```

## github two account 

```bash=
ssh-keygen -t rsa -C "your-email-address"
# Remember to enter filename id_rsaXXXX
```

- Add to `~/.ssh/config`
```
Host github-COMPANY
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_rsa_COMPANY
```

- Remember to add your ssh key to github & use different user.name & user.email in repos

## Other

* Clean

```
git config --local credential.helper ""
git push origin master
```

* Remove submodules
    * Delete lines in `.gitmodules` and `git add .gitmodules`
    * Execute `rm ./.git/config`
    * `git rm --cached path_to_submodule`
    * `rm -rf .git/modules/path_to_submodule`
    * Commit

```bash
# Remove the submodule entry from .git/config
git submodule deinit -f path/to/submodule

# Remove the submodule directory from the superproject's .git/modules directory
rm -rf .git/modules/path/to/submodule

# Remove the entry in .gitmodules and remove the submodule directory located at path/to/submodule
git rm -f path/to/submodule
```

* Merge two different repos

```bash
# clone a & b
cd a
git filter-repo --to-subdirectory-filter a
cd b
git remote add a ../a
git fetch a
git merge --allow-unrelated-histories a/master
git remote remove a
```

* Checkout to tag

```bash
git tag -l
git checkout <tag>
```

## References

Git Submodule 用法筆記
<https://blog.chh.tw/posts/git-submodule/>


<https://stackoverflow.com/questions/1260748/how-do-i-remove-a-submodule/36593218#36593218>
