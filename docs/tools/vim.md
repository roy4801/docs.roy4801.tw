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
