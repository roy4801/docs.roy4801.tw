# pytz - World Timezone Definitions for Python

## To UTC

```python3 linenums="1"
from datetime import datetime
import pytz # $ pip install pytz

d = datetime(2009, 8, 31, 22, 30, 30)
tz = pytz.timezone('US/Pacific')

# a) raise exception for non-existent or ambiguous times
aware_d = tz.localize(d, is_dst=None)
## b) assume standard time, adjust non-existent times
#aware_d = tz.normalize(tz.localize(d, is_dst=False))
## c) assume DST is in effect, adjust non-existent times
#aware_d = tz.normalize(tz.localize(naive_d, is_dst=True))

# convert to UTC
utc_d = aware_d.astimezone(pytz.utc)
```

```python3 linenums="1"
pytz.utc.localize(utc_time, is_dst=None).astimezone(tz)
```

## References

pytz utc conversion
https://stackoverflow.com/questions/1357711/pytz-utc-conversion


