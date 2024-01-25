# map/unordered_map


## unordered_map

### Custom Class as key

```cpp
// Example custom class
struct Foo
{
	string a;
	int b;
};
```

作為 key 的 class 需要有:
1. hash function
2. `operator==`

hash function 可以是去實作 `struct std::hash<T>`。

```cpp
namespace std {
template <>
struct hash<Foo>
{
    std::size_t operator()(const Foo& foo) const
    {
        return hash<string>{}(foo.a) ^
               hash<int>{}(foo.b);
    }
};
}

unordered_map<Foo, int> m; // ok
```

或是自己定義一個 function object 或是 lambda 然後丟到 `unordered_map` 的第三個 template 參數

```cpp
std::unordered_map<Foo, int> m; // error

struct FooHash
{
    size_t operator()(const Foo& foo) const
    {
        return std::hash<string>{}(foo.a) ^
               std::hash<int>{}(foo.b);
    }
};
std::unordered_map<Foo, int, FooHash> m; // ok

auto FooHashLambda = [](const Foo& foo) -> size_t {
	return std::hash<string>{}(foo.a) ^
           std::hash<int>{}(foo.b);
};
std::unordered_map<Foo, int, decltype(FooHashLambda)> m2(1, FooHashLambda); // ok
```

> https://ianyepan.github.io/posts/cpp-custom-hash/
> https://marknelson.us/posts/2011/09/03/hash-functions-for-c-unordered-containers.html


以上範例的 hash 方法是直接 XOR 而這樣很不好，為了避免 hash collision應該用更好的方法: hash combine

```cpp
template <class T>
inline void hash_combine(std::size_t & seed, const T & v)
{
  std::hash<T> hasher;
  seed ^= hasher(v) + 0x9e3779b9 + (seed << 6) + (seed >> 2);
}
// 以上實作其實就是 boost::hash_combine
// #include <boost/functional/hash.hpp>
// boost::hash_combine(seed, x);

namespace std
{
template<typename S, typename T>
struct hash<pair<S, T>>
{
inline size_t operator()(const pair<S, T> & v) const
{
  size_t seed = 0;
  ::hash_combine(seed, v.first);
  ::hash_combine(seed, v.second);
  return seed;
}
};
}
unordered_map<pair<int,int>,int> m; // ok

// 或是
struct pair_hash {
    template <class T1, class T2>
    std::size_t operator () (const std::pair<T1,T2> &p) const {
        auto h1 = std::hash<T1>{}(p.first);
        auto h2 = std::hash<T2>{}(p.second);
        return h1 ^ h2;  
    }
};
unordered_map<pair<int,int>,int, pair_hash> m; // ok
```

> https://www.boost.org/doc/libs/1_35_0/doc/html/hash/combine.html
> https://gist.github.com/eugene-malashkin/884e225ff57aca1b9cbe

```cpp
// boost example
#include <boost/functional/hash.hpp>
struct KeyHasher
{
  std::size_t operator()(const Key& k) const
  {
      using boost::hash_value;
      using boost::hash_combine;
.
      std::size_t seed = 0;
      hash_combine(seed,hash_value(k.first));
      hash_combine(seed,hash_value(k.second));
      hash_combine(seed,hash_value(k.third));
      return seed;
  }
};
```

或是有支援 64-bit 的版本:

```cpp
size_t hash_combine( size_t lhs, size_t rhs ) {
  if constexpr (sizeof(size_t) >= 8) {
    lhs ^= rhs + 0x517cc1b727220a95 + (lhs << 6) + (lhs >> 2);
  } else {
    lhs ^= rhs + 0x9e3779b9 + (lhs << 6) + (lhs >> 2);
  }
  return lhs;
}
```

> https://stackoverflow.com/questions/5889238/why-is-xor-the-default-way-to-combine-hashes/27952689#27952689
> https://stackoverflow.com/questions/17016175/c-unordered-map-using-a-custom-class-type-as-the-key
