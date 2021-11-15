# tarfile - Python

## Compress all files under a path

```python linenums="1"
ar = tarfile.open('test.tar.gz', 'w:gz')
   
for root, dirs, files in os.walk(path):
    for file_name in files:
        ar.add(os.path.join(root, file_name))

ar.close()
```

## Extract all files

```python linenums="1"
tar = tarfile.open(path, 'r:gz')
tar.extractall()
```

## Modes

| 模式         | 操作                                                                                                          |
|--------------|-------------------------------------------------------------------------------------------------------------|
| 'r' or 'r:*' | Open for reading with transparent compression (recommended).                                                |
| 'r:'         | Open for reading exclusively without compression.                                                           |
| 'r:gz'       | Open for reading with gzip compression.                                                                     |
| r:bz2'       | Open for reading with bzip2 compression.                                                                    |
| 'r:xz'       | Open for reading with lzma compression.                                                                     |
| 'x' or 'x:'  | Create a tarfile exclusively without compression. Raise an FileExistsError exception if it already exists.  |
| 'x:gz'       | Create a tarfile with gzip compression. Raise an FileExistsError exception if it already exists.            |
| 'x:bz2'      | Create a tarfile with bzip2 compression. Raise an FileExistsError exception if it already exists.           |
| 'x:xz'       | Create a tarfile with lzma compression. Raise an FileExistsError exception if it already exists.            |


## References

[Python] 使用 tarfile 壓縮、解壓縮檔案<br />
<https://clay-atlas.com/blog/2020/08/14/python-cn-tarfile-compression-uncompression/>

tarfile — Read and write tar archive files
<https://docs.python.org/3/library/tarfile.html>
