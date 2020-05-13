# CMake

## Commandline

* Generate
	* [CMake Generators](https://cmake.org/cmake/help/v3.0/manual/cmake-generators.7.html)

```bash
cmake -G <generator> -B <build_dir> -D <build_type> <path_to_proj>
# Or
mkdir <build_dir> && cd <build_dir> && cmake -G <generator> ..
```

* `CMAKE_BUILD_TYPE`
	* `Debug` 產生除錯資訊
	* `Release` 進行執行速度最佳化
	* `RelWithDebInfo` 進行執行速度最佳化，但仍然會啟用 debug flag
	* `MinSizeRel`  進行程式碼最小化

* Compile

```bash
cmake --build <build_dir> --config Release

# makefile
cd <build> && make -j<process>
```


* Install

```bash
cmake --build <build_dir> --target install

# makefile
cd <build_dir> && make install
```

## `CMakeLists.txt`

* Set compile option for a target
```
target_compile_options(target_name
    PUBLIC -optionA -optionB ...
)
```
	* e.g.
	```
	-Wall -Wextra -Wshadow -Wnon-virtual-dtor -pedantic -Woverloaded-virtual -Wduplicated-cond -Wduplicated-branches -Wlogical-op -Wnull-dereference -Wno-sign-compare
	```

## References

Build types in CMake<br>
<https://codeyarns.com/2015/05/14/build-types-in-cmake/>

CMake 入門/加入編譯選項<br>
<https://zh.m.wikibooks.org/zh-hant/CMake_%E5%85%A5%E9%96%80/%E5%8A%A0%E5%85%A5%E7%B7%A8%E8%AD%AF%E9%81%B8%E9%A0%85>