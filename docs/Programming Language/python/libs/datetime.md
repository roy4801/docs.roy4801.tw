# datetime

## Conversion

* `str` to `datetime`

```python linenums="1"
from datetime import datetime
datetime.strptime('2019-01-01','%Y-%m-%d')
# datetime.datetime(2019, 1, 1, 0, 0)
```

* `datetime` to `str`

```python linenums="1"
from datetime import datetime
datetime.strftime(datetime.now(), '%Y-%m-%d %H:%M:%S')
# '2021-10-20 14:08:36'
```

