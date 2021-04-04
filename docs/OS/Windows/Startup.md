# Startup

- Use `Run` to navigate to the startup folder
	- All Users: `shell:common startup`
		- Path: `C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp`
	- Current User: `shell:startup`
		- Path: `C:\Users\<UserName>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`

- Registry
	- `HKLM\Software\Microsoft\Windows\CurrentVersion\Run`
		- Local Machine
	- `HKCU\Software\Microsoft\Windows\CurrentVersion\Run`
		- Current User

## Ref

<https://community.spiceworks.com/how_to/158583-how-to-remove-startup-program-in-registry-editor>