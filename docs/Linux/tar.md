# Compression Tools

## tar

* File exts
```
*.Z              compress 壓縮的檔案
*.zip            zip 壓縮的檔案
*.gz             gzip 壓縮的檔案
*.bz2            bzip2 壓縮的檔案
*.xz             xz 壓縮的檔案

*.tar            tar 打包的資料，沒有壓縮
*.tar.gz == .tgz tar 打包的檔案，由 gzip 壓縮

*.tar.bz2        tar 打包的檔案，由 bzip2 壓縮
  == .tbz == tb2

*.tar.xz         tar 打包的檔案，由 xz 壓縮
  == .txz
```

* Overview
```bash
tar 操作 選項 檔案...
```

* 操作
	* `c` 建立(Create) tar
	* `x` 解開(Extract) tar
	* `t` 列出 tar 中檔案

* 選項
	* `v` 詳細輸出（進度）verbose
	* `f` tar 名稱（接載後頭）

* 壓縮格式
	* `z` gzip
	* `j` bzip2
	* `J` xz
	* `--lzma` lzma

## Cheat

* Pack

```bash
tar cvf name.tar file1 dir1/ ... # no compression
tar czvf name.tar.gz ...         # gzip
tar cjvf name.tar.bz2 ...        # bzip2
tar cJvf name.tar.xz ...         # xz
tar --lzma cvf name.tar.lzma ... # lzma
```

* Extract

```bash
tar xvf name.tar.*        # 解壓到當前目錄
tar xvf name.tar.* -C dir # 解壓到指定目錄
tar xvf name.tar.* path/to/file... # 解壓特定的檔案

--wildcards "*.html" # 符合 pattern
-k  # 不覆蓋
-p  # 保留權限
```

* List files in tar.*
```bash
tar tf name.tar   # like ls
tar tvf name.tar  # like ls -l
```
![](https://i.imgur.com/Gez6sPT.png)
![](https://i.imgur.com/3id6X3D.png)

* 其他

```
--exclude=PATTERN   # 排除的檔案
--X FILE            # 排除的列表(寫在FILE裡)
```

## Reference

tar(1) - Linux man page<br>
<https://linux.die.net/man/1/tar>

GNU / Linux 各種壓縮與解壓縮指令<br>
<http://note.drx.tw/2008/04/command.html>

UNIX/Linux 檔案壓縮與備份工具 tar 指令使用教學與範例<br>
<https://blog.gtwang.org/linux/tar-command-examples-in-linux-2/>

鳥哥<br>
<http://linux.vbird.org/linux_basic/0240tarcompress.php>

cheatsheet<br>
<http://cht.sh/tar>

wiki<br>
<https://zh.wikipedia.org/wiki/Tar>