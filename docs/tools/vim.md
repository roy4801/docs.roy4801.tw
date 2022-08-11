# vim

## Repoen as root

```
:w !sudo tee %
```

Add to `.vimrc`

```
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
```

https://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work

## Search and replace

- regex (e.g. `foo` -> `bar`)

```
s/foo/bar/g
```

- From line to line (e.g. `foo` -> `bar`)

```
:1,10s/foo/bar/g
```

![](https://i.imgur.com/ifS2j7e.png)

https://stackoverflow.com/questions/17319557/search-and-replace-in-vim-in-specific-lines
