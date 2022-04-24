# Disk related

* `diskutil`
	* `diskutil list` List

* Mount ntfs on macos
	* `sudo ntfs-3g /dev/disk3s1 /Volumes/NTFS -olocal -oallow_other -o auto_xattr`
	* [ezntfs](https://github.com/undecidabot/ezntfs)
	* [mounty](https://mounty.app/)

## Hard link & Symbolic link

- Hard Link
	- 以相同的i-node指向相同的檔案。
	- 主要用於備份。
	- 只能在同一個磁區 (Partition)中建立，不能跨 Filesystem
	- 只能連結檔案，不能連結目錄。
	- `ln <src> <dst>`

- Symbolic Link
	- 以絕對路徑或相對路徑指向原始的檔案。
	- 主要用於簡化路徑。
	- `ln -s <src> <dst>`

### References

Hard Link與Symbolic Link的比較
https://claire-chang.com/2019/10/03/hard-link%E8%88%87symbolic-link%E7%9A%84%E6%AF%94%E8%BC%83/

硬連結？軟連結？檔案分身不乏術
https://www.techbang.com/posts/12538-hard-links-soft-links-archives-does-not-fashu
