# Right Click Menu

!!!info
	Save as `.reg`

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

## Ref

<https://github.com/microsoft/terminal/issues/1060>