# rclone

- list

```bash linenums="1"
# List all
rclone ls gdrive:

# List directories
rclone lsd gdrive:
```

- size

```bash linenums="1"
rclone size gdrive:
```

- Sync
	- `--fast-list`: Store list in mem
	- `--transfers=N`: Transfer N files at once

```bash linenums="1"
rclone sync -P --fast-list --transfers=32 gdrive:/ .
```

- Show google drive shared with me: `--drive-shared-with-me`

- Limit speed: `--bwlimit 8M`

- Cheatsheet
```bash linenums="1"
rclone copy -P --fast-list --bwlimit 8M --drive-shared-with-me drive:/A ./A
```

## Reference

<https://www.dmuth.org/back-up-your-google-drive-files-with-rclone/>
