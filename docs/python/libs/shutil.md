# shutil

High-level file operations

* Copy files `src` to file or directory `dst`

```python3
shutil.copy(src, dst)
shutil.copy(src, dst) # try to preserve metadata
```

* Move a file or directory `src` to another location `dst` and return the dest

```python3
shutil.move(src, dst)
```

* Disk usage (byte)

```python3
total, used, free = shutil.disk_usage(path)
```