# dict

## Construct

```python linenums="1"
>>> a = dict(one=1, two=2, three=3)
>>> b = {'one': 1, 'two': 2, 'three': 3}
>>> c = dict(zip(['one', 'two', 'three'], [1, 2, 3]))
>>> d = dict([('two', 2), ('one', 1), ('three', 3)])
>>> e = dict({'three': 3, 'one': 1, 'two': 2})
>>> f = dict({'one': 1, 'three': 3}, two=2)
>>> a == b == c == d == e == f
True
```

## Exist

```python linenums="1"
d = {'a' : 10, 'b' : 20}
if 'a' in d:
    # In
if 'na' not in d:
    # Not in
```

## Access

```python linenums="1"
d = {'a' : 10, 'b' : 20}

d['a']         # 10 throw KeyError if the key is not existed
d.get('c', 87) # 87

a = {'a': 123}
a.setdefault('a')     # 123
a.setdefault('b', 87) # 87
```

#### Use `collections.defaultdict` to prevent use `.get()` at every access

```python linenums="1"
from collections import defaultdict
d = defaultdict(int)
d['123'] # 0

# Change the default
def cf(v):
    return lambda: v
d = defaultdict(cf(87))
d['123'] # 87
```

## Operation

#### Insert

```python linenums="1"
d = {}
d.update(a=10, b=123)
d.update({'c': 87})
d['d'] = 123
```

#### Erase

Delete the key value pair from the dict

```python linenums="1"
d = {'a' : 10, 'b' : 20}
p = d.pop('a')      # 10
p2 = d.pop('c', 87) # 87
```

#### Clear

Remove all items from the dictionary

```python linenums="1"
d = {'a' : 10, 'b' : 20}
d.clear()
```

#### Copy

```python linenums="1"
import copy

a = {"first" : 10, "second" : [1, [2, 3]]}
b = a                # reference
c = a.copy()         # shallow copy
d = copy.deepcopy(a) # deep copy

id(a) == id(b) # True
id(a) == id(c) # False

# The shallow copy one still have the same reference of its elements
id(c['second']) == id(a['second']) # True

# Use deepcopy() you will get the truely copied one
id(d['second']) == id(a['second']) # False
```

## Views

```python linenums="1"
d = {'a': 123, 'b': 456, 'c': 789}

d.keys()   # dict_keys(['a', 'b', 'c'])
d.values() # dict_values([123, 456, 789])
d.items()  # dict_items([('a', 123), ('b', 456), ('c', 789)])
```
