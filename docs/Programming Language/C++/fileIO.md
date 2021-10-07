# I/O 


## Read file lines

```cpp linenums="1"
#include <fstream>
std::ifstream file("file");
std::string line;
while (std::getline(file, line))
{
	// ...
}
```

