# decorator

* Make a wrapper for function and provide a syntatic sugar

```python
import functools
def my_decorator(func):
    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        # before
        res = func(*args, **kwargs)
        # after
        return res
    return wrapper
# Usage
@my_decorator
def hello():
    print('Hello')
```

> `functools.wrap()` uses `functools.update_wrapper()` to update attributes like `__name__` and `__doc__` for type introspection

* Usage for e.g.: debug print, timing, lightweight plugin system

> TODO

## References

Primer on Python Decorators<br>
<https://realpython.com/primer-on-python-decorators/>
