# string

## split

* `strtok` in C

* `std::string::find` + `std::string::substr` in-place

```cpp linenums="1"
auto start = 0U;
auto end = s.find(delim);
while (end != std::string::npos)
{
    std::cout << s.substr(start, end - start) << std::endl;
    start = end + delim.length();
    end = s.find(delim, start);
}
std::cout << s.substr(start, end);
```

* `string_view` >= C++17
	- TODO: testing

```cpp linenums="1"
std::vector<std::string_view> split(std::string_view buffer, const std::string_view delimeter = " ")
{
    std::vector<std::string_view> ret{};
    std::decay_t<decltype(std::string_view::npos)> pos{};
    while ((pos = buffer.find(delimeter)) != std::string_view::npos)
    {
        const auto match = buffer.substr(0, pos);
        if (!match.empty())
            ret.push_back(match);
        buffer = buffer.substr(pos + delimeter.size());
    }
    if (!buffer.empty())
        ret.push_back(buffer);
    return ret;
}
```

* >= C++20
	- TODO: testing

```cpp linenums="1"
#include <ranges>
#include <string_view>
auto split = hello
    | std::ranges::views::split(' ')
    | std::ranges::views::transform([](auto&& str) { 
    	return std::string_view(&*str.begin(), std::ranges::distance(str)); 
    });
```

<https://stackoverflow.com/questions/14265581/parse-split-a-string-in-c-using-string-delimiter-standard-c>

## contains

* `C++23`

```cpp linenums="1"
str.contains("niddle");
```

* Boost

```cpp linenums="1"
#include <boost/algorithm/string.hpp>
bool b = boost::algorithm::contains(s, t);
```

* Vanilla

```cpp linenums="1"
if (s1.find(s2) != std::string::npos) {
    std::cout << "found!" << '\n';
}
```

## endswith, startswith

TODO
