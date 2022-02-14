# cheatsheet - python

## Delete 

```python3 linenums="1"
deduplicate = lambda s,c: c.join([substring for substring in s.strip().split(c) if substring])

deduplicate('a    b      c', ' ') # "a b c"
```
