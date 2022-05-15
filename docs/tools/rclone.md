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

## Reference

<https://www.dmuth.org/back-up-your-google-drive-files-with-rclone/>
