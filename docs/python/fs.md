# fs

file-system related

* List directory

```python3
os.listdir('/') -> [paths]
```

* Current directory (`pathlib`) 

```python3
from pathlib import Path

Path.cwd()    # Get current dir

full_path = Path(__file__).resolve()
dir_name = full_path.parent
```

* Current directory (`os`)

```python3
os.getcwd()      # Get current dir
os.chdir('/usr') # Change current dir

__file__         # Current filename
dir_name = os.path.dirname(full_path)
full_path = os.path.realpath(__file__)

# Spilt
path, filename = os.path.split(full_path)
```

* Delete a file

```python3
Path(file_path).unlink() == os.remove(file_path)
```

* `rm -r`

```python3
shutil.rmtree(path)
```

* Delete a dir

```python3
Path(dir_path).rmdir() == os.rmdir(dir_path)
```

![](https://i.imgur.com/zhTMe60.png)

## See Also

* [shutil](/python/libs/shutil/)

## References

pathlib — Object-oriented filesystem paths<br>
<https://docs.python.org/3/library/pathlib.html>

os — Miscellaneous operating system interfaces<br>
<https://docs.python.org/3/library/os.html>