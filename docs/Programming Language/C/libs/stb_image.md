# stb_image

[stb_image.h](https://github.com/nothings/stb/blob/master/stb_image.h) 是一個 header-only 的圖片載入 library 是 [stb](https://github.com/nothings/stb) 系列的其中之一，支援 jpg, png, tga, bmp, psd, gif, hdr, pic 等格式。

* 下載 `stb_image.h` 並加到你的專案中，並另新增一個 `.cpp` 輸入代碼
    ```cpp
    #define STB_IMAGE_IMPLEMENTATION
    #include "stb_image.h"
    ```

* 載入圖片

```cpp
int width, height, nrChannels;
unsigned char *data = stbi_load("example.jpg", &width, &height, &nrChannels, 0);

// free
stbi_image_free(data);
```
