# filesystem

## Cheatsheet

- Convert `path::iterator` to string
	- Use `.string()`

- Remove trailing slash
	- `std::filesystem::canonical()` in C++17
	- Erase the character before converting to path object
	- Append a fake file and use `.parent_path()`

```cpp linenums="1"
p /= "FAKE.PATH";
p = p.lexically_normal();
p = p.parent_path();
```

## Reference

parent_path() with or without trailing slash - stackoverflow
https://stackoverflow.com/questions/36941934/parent-path-with-or-without-trailing-slash

