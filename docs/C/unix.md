# *nix

## realpath

```c
#include <limits.h>
#include <stdlib.h>

char path[PATH_MAX];
char *p = realpath("../path/to/files", path);
```

## Retrieve filename from file descriptor

* Use `readlink` on `/proc/self/fd/XXX` (Linux)

```c
char fdpath[PATH_MAX];
snprintf(fdpath, sizeof(fdpath), "/proc/self/fd/%d", fd);
int siz = readlink(fdpath, buf, buf_size);
if(siz != -1)
    buf[siz == PATH_MAX ? PATH_MAX-1 : siz] = '\0';
```

* Use `fcntl`

```c
#include <sys/syslimits.h>
#include <fcntl.h>

char filePath[PATH_MAX];
if (fcntl(fd, F_GETPATH, filePath) != -1)
{
    // do something with the file path
}
```