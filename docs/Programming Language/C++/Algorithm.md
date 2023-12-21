# Algorithm

## remove, remove_if

```cpp linenums="1"
auto it = std::remove(v.begin(), v.end(), 10);
std::erase(it, v.end()); // actual remove
```

> https://www.cnblogs.com/fortunely/p/15694743.html

## max_element, min_element

```cpp linenums="1"
int max = *std::max_element(v.begin(), v.end());
int min = *std::min_element(v.begin(), v.end());
```

## 集合運算

可以用在其他 container 上，但要注意要不要 sort，和 `inserter` 或 `back_inserter`

```cpp linenums="1"
set<int> a = {1, 2, 3};
set<int> b = {3, 4, 5};
set<int> c;

set_union(a.begin(), a.end(), b.begin(), b.end(), inserter(c, c.begin()));
// 1 2 3 4 5

set_intersection(a.begin(), a.end(), b.begin(), b.end(), inserter(c, c.begin()));
// 3

set_difference(a.begin(), a.end(), b.begin(), b.end(), inserter(c, c.begin()));
// 1 2

set_difference(b.begin(), b.end(), a.begin(), a.end(), inserter(c, c.begin()));
// 4 5

set_symmetric_difference(a.begin(), a.end(), b.begin(), b.end(), inserter(c, c.begin()));
// 1 2 4 5
```

