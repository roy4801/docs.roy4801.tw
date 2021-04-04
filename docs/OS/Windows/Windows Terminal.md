# Windows Terminal

* Settings
    * Terminals
        * cmd
        * powershell
        * msys2
        * cmder

```
// To view the default settings, hold "alt" while clicking on the "Settings" button.
// For documentation on these settings, see: https://aka.ms/terminal-documentation
{
    "$schema": "https://aka.ms/terminal-profiles-schema",

    "defaultProfile": "{0caa0dad-35be-5f56-a8ff-afceeeaa6101}",

    "disabledProfileSources": [
        "Windows.Terminal.Azure"
    ],

    // You can add more global application settings here.
    // To learn more about global settings, visit https://aka.ms/terminal-global-settings

    // If enabled, selections are automatically copied to your clipboard.
    "copyOnSelect": false,

    // If enabled, formatted data is also copied to your clipboard
    "copyFormatting": false,

    // A profile specifies a command to execute paired with information about how it should look and feel.
    // Each one of them will appear in the 'New Tab' dropdown,
    //   and can be invoked from the commandline with `wt.exe -p xxx`
    // To learn more about profiles, visit https://aka.ms/terminal-profile-settings
    "profiles":
    {
        "defaults":
        {
            // Put settings here that you want to apply to all profiles.
            "startingDirectory": "."
        },
        "list":
        [
            {
                // Make changes here to the cmd.exe profile.
                "guid": "{0caa0dad-35be-5f56-a8ff-afceeeaa6101}",
                "name": "Command Prompt",
                "commandline": "cmd.exe",
                "hidden": false,
                // "startingDirectory": "%USERPROFILE%",
            },
            {
                // Make changes here to the powershell.exe profile.
                "guid": "{61c54bbd-c2c6-5271-96e7-009a87ff44bf}",
                "name": "Windows PowerShell",
                "commandline": "powershell.exe",
                "hidden": false,
                // "startingDirectory": "%USERPROFILE%",
            },
            {
                "guid": "{b453ae62-4e3d-5e58-b989-0a998ec441b8}",
                "hidden": false,
                "name": "Azure Cloud Shell",
                "source": "Windows.Terminal.Azure",
                // "startingDirectory": "%USERPROFILE%",
            },
            {
                "name": "Windows Terminal (elevated)",
                "commandline": "powershell.exe -command Start-Process -Verb RunAs \"shell:appsFolder\\Microsoft.WindowsTerminal_8wekyb3d8bbwe!App\"",
                "hidden": false,
                "icon": "ms-appx:///Images/Square44x44Logo.targetsize-32.png",
                // "startingDirectory": "%USERPROFILE%",
            },
            {
                "acrylicOpacity": 1.0,
                "closeOnExit": true,
                "colorScheme": "Campbell",
                "commandline": "cmd.exe /c \"set MSYSTEM=MINGW32&& set MSYS=winsymlinks:nativestrict&& set MSYS2_PATH_TYPE=inherit&& C:/msys64/usr/bin/bash.exe --login\"",
                "cursorColor": "#FFFFFF",
                "cursorShape": "bar",
                // "fontFace": "Consolas",
                // "fontSize": 10,
                "guid": "{1597a4d0-b666-4b1f-a8d3-79af62638679}",
                "historySize": 9001,
                "icon": "C:\\msys64\\msys2.ico",
                "name": "MSYS2 32bit",
                "padding": "0, 0, 0, 0",
                "snapOnInput": true,
                // "startingDirectory": "%USERPROFILE%",
                "useAcrylic": true
            },
            {
                "acrylicOpacity": 1.0,
                "closeOnExit": true,
                "colorScheme": "Campbell",
                "commandline": "cmd.exe /c \"set MSYSTEM=MINGW64&& set MSYS=winsymlinks:nativestrict&& set MSYS2_PATH_TYPE=inherit&& C:/msys64/usr/bin/bash.exe --login\"",
                "cursorColor": "#FFFFFF",
                "cursorShape": "bar",
                // "fontFace": "Consolas",
                // "fontSize": 10,
                "guid": "{54a0ab5e-1f34-4e0a-ae96-0eb964e11f68}",
                "historySize": 9001,
                "icon": "C:\\msys64\\msys2.ico",
                "name": "MSYS2 64bit",
                "padding": "0, 0, 0, 0",
                "snapOnInput": true,
                // "startingDirectory": "%USERPROFILE%",
                "useAcrylic": true
            },
            {
				"guid": "{cd7ea819-1bda-4d3d-8a32-db0e96bc72ad}",
				"acrylicOpacity" : 1.0,
				"closeOnExit" : true,
				"colorScheme" : "Campbell",
				"commandline" : "cmd.exe /k E:\\cmder\\vendor\\init.bat",
				"cursorColor" : "#FFFFFF",
				"cursorShape" : "bar",
				"fontFace" : "Consolas",
				"fontSize" : 13,
				"historySize" : 9001,
				"icon" : "E:\\cmder\\cmder\\icons\\cmder.ico",
				"name" : "Cmder",
				"snapOnInput" : true,
				"useAcrylic" : true
			},
            {
                "guid": "{2c4de342-38b7-51cf-b940-2309a097f518}",
                "hidden": false,
                "name": "Ubuntu",
                "source": "Windows.Terminal.Wsl"
            }
        ]
    },

    // Add custom color schemes to this array.
    // To learn more about color schemes, visit https://aka.ms/terminal-color-schemes
    "schemes": [],

    // Add custom actions and keybindings to this array.
    // To unbind a key combination from your defaults.json, set the command to "unbound".
    // To learn more about actions and keybindings, visit https://aka.ms/terminal-keybindings
    "actions":
    [
        // Copy and paste are bound to Ctrl+Shift+C and Ctrl+Shift+V in your defaults.json.
        // These two lines additionally bind them to Ctrl+C and Ctrl+V.
        // To learn more about selection, visit https://aka.ms/terminal-selection
        { "command": {"action": "copy", "singleLine": false }, "keys": "ctrl+c" },
        { "command": "paste", "keys": "ctrl+v" },

        // Press Ctrl+Shift+F to open the search box
        { "command": "find", "keys": "ctrl+shift+f" },

        // Press Alt+Shift+D to open a new pane.
        // - "split": "auto" makes this pane open in the direction that provides the most surface area.
        // - "splitMode": "duplicate" makes the new pane use the focused pane's profile.
        // To learn more about panes, visit https://aka.ms/terminal-panes
        { "command": { "action": "splitPane", "split": "auto", "splitMode": "duplicate" }, "keys": "alt+shift+d" }
    ]
}
```

## See Also

* [Enable Right Menu](/Windows/Right%20Menu/)
