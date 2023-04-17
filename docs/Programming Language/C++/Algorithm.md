# Algorithm

## remove, remove_if

```cpp=
auto it = std::remove(v.begin(), v.end(), 10);
std::erase(it, v.end()); // actual remove
```

> https://www.cnblogs.com/fortunely/p/15694743.html

## max_element, min_element

```cpp=
int max = *std::max_element(v.begin(), v.end());
int min = *std::min_element(v.begin(), v.end());
```
