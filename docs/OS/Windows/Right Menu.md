# Right Click Menu

!!!info
	Save as `.reg`

## Notes

- Need root
	- `HKEY_CLASSES_ROOT\*\shell` all ext
	- `HKEY_CLASSES_ROOT\Folder\shell` Folders

## Windows Terminal

```
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\Directory\Background\shell\wt]
@="Windows terminal here"
"Icon"="%USERPROFILE%\\AppData\\Local\\terminal\\wt_32.ico"

[HKEY_CLASSES_ROOT\Directory\Background\shell\wt\command]
@="%LOCALAPPDATA%\\Microsoft\\WindowsApps\\wt.exe"
```

## sublime text

```
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\*\shell\Edit with Sublime Text]
@="Edit with &Sublime Text"
"Icon"="C:\\Program Files\\Sublime Text\\sublime_text.exe,0"
"MuiVerb"="Edit with Sublime Text"

[HKEY_CLASSES_ROOT\*\shell\Edit with Sublime Text\command]
@="C:\\Program Files\\Sublime Text\\sublime_text.exe \"%1\""

[HKEY_CLASSES_ROOT\Directory\Background\shell\Sublime]
@="Open with Sublime Text"
"Icon"="C:\\Program Files\\Sublime Text\\sublime_text.exe,0"

[HKEY_CLASSES_ROOT\Directory\Background\shell\Sublime\command]
@="\"C:\\Program Files\\Sublime Text\\sublime_text.exe\" \"%V\""

[HKEY_CLASSES_ROOT\Directory\shell\Sublime]
@="Open with Sublime Text"
"Icon"="C:\\Program Files\\Sublime Text\\sublime_text.exe,0"

[HKEY_CLASSES_ROOT\Directory\shell\Sublime\command]
@="\"C:\\Program Files\\Sublime Text\\sublime_text.exe\" \"%1\""
```

## NeoVim

```
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\*\shell\Open in NeoVim]
"Icon"=hex(2):43,00,3a,00,5c,00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,00,20,\
  00,46,00,69,00,6c,00,65,00,73,00,5c,00,4e,00,65,00,6f,00,76,00,69,00,6d,00,\
  5c,00,62,00,69,00,6e,00,5c,00,6e,00,76,00,69,00,6d,00,2d,00,71,00,74,00,2e,\
  00,65,00,78,00,65,00,00,00

[HKEY_CLASSES_ROOT\*\shell\Open in NeoVim\command]
@="\"C:\\Program Files\\Neovim\\bin\\nvim-qt.exe\" \"%1\""

[HKEY_CURRENT_USER\SOFTWARE\Classes\*\shell\Open in NeoVim]
"Icon"=hex(2):43,00,3a,00,5c,00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,00,20,\
  00,46,00,69,00,6c,00,65,00,73,00,5c,00,4e,00,65,00,6f,00,76,00,69,00,6d,00,\
  5c,00,62,00,69,00,6e,00,5c,00,6e,00,76,00,69,00,6d,00,2d,00,71,00,74,00,2e,\
  00,65,00,78,00,65,00,00,00

[HKEY_CURRENT_USER\SOFTWARE\Classes\*\shell\Open in NeoVim\command]
@="\"C:\\Program Files\\Neovim\\bin\\nvim-qt.exe\" \"%1\""
```

## Ref

<https://github.com/microsoft/terminal/issues/1060>