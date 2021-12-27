# io - Core tools for working with streams

## StringIO - Read string as a stream

```python3 linenum="1"
from io import StringIO
ss = StringIO('foo\nbar\nend\n')

.read()
.readline()
.readlines()
.write()
.writelines()
```

## References

<https://stackoverflow.com/questions/21843693/creating-stream-to-iterate-over-from-string-in-python>
