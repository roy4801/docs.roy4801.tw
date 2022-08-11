# OpenGL Texture

![](https://i.imgur.com/PVK5oZB.png)

- While process:
	- loading image
	- images -> textures
	- bind texture unit & prepare shader
	- rendering :)

- TL;DR for loading
	```cpp linenums="1"
	unsigned int texture;
	glGenTextures(1, &texture);
	glBindTexture(GL_TEXTURE_2D, texture);
	//
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);   
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	//
	unsigned char *data = load_image("example.jpg"); // 自訂載入圖片方式
	uint32_t width = /* 圖片的寬 */;
	uint32_t height = /* 圖片的高 */;
	if (data)
	{
	    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, width, height, 0, GL_RGB, GL_UNSIGNED_BYTE, data);
	    glGenerateMipmap(GL_TEXTURE_2D);
	}
	else
	{
	    std::cout << "Failed to load texture" << std::endl;
	}
	free_image(data); // 釋放圖片
	```

- There is no TL;DR for using :(

## Loading Textures

- Create texture

```cpp linenums="1"
uint32_t tex;
glGenTexture(1, &tex);
```

* Bind texture

```cpp linenums="1"
// >= OpenGL 4.5
glBindTextureUnit(unit, texture)
// < OpenGL 4.5
glActiveTexture(GL_TEXTURE0 + unit);
glBindTexture(GL_TEXTURE_2D, texture);
```

- Loading images to textures
	- 各個平台、不同的圖片格式甚至是底層的 library 都有不同的圖片載入的方法，因此這裡不贅述
	- [stb_image](/Programming%20Language/C/libs/stb_image/)

```cpp
glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, width, height, 0, GL_RGB, GL_UNSIGNED_BYTE, data);
glGenerateMipmap(GL_TEXTURE_2D);
```

??? note "[glTexImage2D(target, level, internalFormat, width, height, border,  format,  type, * data)](http://docs.gl/gl4/glTexImage2D)"
	* Target
    * Mipmap Level
        * 0 = base
    * internalFormat 儲存格式
    * width 寬度, height 高度
    * border 永遠 = 0 (歷史遺留)
    * format 原圖格式
    * type 資料類型
    * data 真正的圖像資料

## Texture Wrapping 材質環繞方式

![](https://i.imgur.com/MIwTxEj.png)

材質座標的範圍是 $[0, 1]$(第一象限) ，如果超出這個座標之外預設的行為是重複，但其實 OpenGL 提供了更多的選擇:

| 環繞方式 | 描述 |
| -------- | -------- |
| `GL_REPEAT` | 預設，重複材質圖像 |
| `GL_MIRRORED_REPEAT` | 一樣是重複材質，但圖片是鏡像的 |
| `GL_CLAMP_TO_EDGE` | 材質座標會被約束在 $[0,1]$，超出的部分會重複邊緣<br>並產生拉伸的效果 |
| `GL_CLAMP_TO_BORDER` | 超出的座標為指定的顏色 |

這些選項都可以對單獨的材質座標軸設定，s, t 和 r 軸(如果是 3D 的話)

```cpp
glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_MIRRORED_REPEAT);
glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_MIRRORED_REPEAT);
// glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_R, GL_MIRRORED_REPEAT);
```

* 選擇 `GL_CLAMP_TO_BORDER` 則還需要指定一個顏色

```cpp
float borderColor[] = {1.0f, 1.0f, 0.0f, 1.0f};
glTexParameterfv(GL_TEXTURE_2D, GL_TEXTURE_BORDER_COLOR, borderColor);
```

## Texture Filtering

紋理座標跟解析度無關，所以 OpenGL 要知道怎麼將紋理像素(Texture Pixel, Texel)映射到紋理座標(Texture Coordinate)。
如果一個很大的物體，可是紋理解析度很低，就會有明顯的瑕疵出現。

* 紋理濾波 Texture Filter
    * `GL_NEAREST`
    * `GL_LINEAR`
    * 其他過濾方式，[參見](https://zh.wikipedia.org/wiki/%E7%BA%B9%E7%90%86%E6%BB%A4%E6%B3%A2)

* 鄰近濾波 Nearest Neighbor Filtering
    * OpenGL 預設使用 `GL_NEAREST`
    * 選 Texture Coordinate 最接近的 紋素(Texel)
    * 看起來產生了顆粒狀

![](https://i.imgur.com/y8MnkAO.png)

* [雙線性過濾 Bilinear Filtering](https://zh.wikipedia.org/wiki/%E5%8F%8C%E7%BA%BF%E6%80%A7%E8%BF%87%E6%BB%A4)
    * `GL_LINEAR`
    * 基於紋理座標附近的紋理像素，計算插值，近似出這些紋理像素們之間的顏色
    * 紋理座標離該紋理像素越接近則對最終顏色貢獻越大
    * 看起來平滑

![](https://i.imgur.com/BHEaZfy.png)

![](https://i.imgur.com/MDqCMdT.png)

* OpenGL 可以設定紋理在放大或縮小時要使用的過濾方式
    * `GL_TEXTURE_MIN_FILTER` 縮小
    * `GL_TEXTURE_MAG_FILTER` 放大

```cpp
// 縮小使用 GL_NEAREST
glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
// 放大使用 GL_LINEAR
glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
```

## Mipmapping

假如說場景在開闊的地方，有上千個物體，每個物體上都有紋理，近處的物體的紋理解析度很高，但遠處的物體可能只產生很小的片段(Fragment)，在高解析度的紋理中這種物體的顏色通常都不正確，並且也浪費記憶體。

![](https://i.imgur.com/voF4WPi.png)

多級漸遠紋理(Mipmap)是一系列的紋理圖像，後一個的大小是前個的二分之一。當觀察者的距離超過一定的閾值(threshold)，自動切換至適合該距離的紋理。距離遠用解析度比較小的，也不容易被察覺。

Mipmap 可以自己手動產生，不過 OpenGL 可以幫我們自動產生。

* 紋理過濾等級 + Mipmap
    * `_MIPMAP_NEAREST`
        * 使用最接近的 Mip Level
    * `_MIPMAP_LINEAR`
        * 在兩個最接近的 Mip Level 插值

```cpp
glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_LINEAR);
glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
glGenerateMipmap(GL_TEXTURE_2D);
```

!!!info
	放大過濾不可以使用 Mipmap ，因為 Mipmap 是給縮小紋理使用的

## Using Textures

Need to prepare texture coordinates in vertices like:

```cpp
float vertices[] = {
//     ---- 位置 ----    紋理座標 -
     0.5f,  0.5f, 0.0f, 1.0f, 1.0f,   // 右上
     0.5f, -0.5f, 0.0f, 1.0f, 0.0f,   // 右下
    -0.5f, -0.5f, 0.0f, 0.0f, 0.0f,   // 左下
    -0.5f,  0.5f, 0.0f, 0.0f, 1.0f    // 左上
};
```

- Setting up vertex attributes

```cpp linenums="1"
uint32_t aPos = glGetAttribLocation(shader, "aPos");
glVertexAttribPointer(aPos, 3, GL_FLOAT, GL_FALSE, 5 * sizeof(float), (void *)0);
glEnableVertexAttribArray(aPos);
uint32_t aTexCoord = glGetAttribLocation(shader, "aTexCoord");
glVertexAttribPointer(aTexCoord, 2, GL_FLOAT, GL_FALSE, 5 * sizeof(float), (void*)(3*sizeof(float)));
glEnableVertexAttribArray(aTexCoord);
```

- In Shaders
	- vs
		```glsl linenums="1"
		#version 450 core
		layout (location = 0) in vec3 aPos;
		layout (location = 1) in vec2 aTexCoord;

		out vec2 TexCoord;

		void main()
		{
		    gl_Position = vec4(aPos.x, aPos.y, aPos.z, 1.0);
		    TexCoord = aTexCoord;
		}
		```
	- fs
		```glsl linenums="1"
		#version 450 core
		out vec4 FragColor;

		in vec2 TexCoord;

		uniform sampler2D tex;

		uniform vec4 fColor;

		void main()
		{
		    FragColor = texture(tex, TexCoord) * fColor;
		}
		```

!!!info
	GLSL 內建 texture() 函數來採樣，第一個參數是採樣的紋理，第二個參數是紋理座標，輸出去紋理座標(插值後)並且經過 Filter 後的顏色。

- Bind texture units

```cpp linenums="1"
glActiveTexture(GL_TEXTURE0); // 啟用第 0 號 texture
glBindTexture(GL_TEXTURE_2D, texture); // 將紋理綁定上 GL_TEXTURE0
```

### Bind multiple textures

- fs

```glsl linenums="1"
#version 450 core

uniform sampler2D tex1;
uniform sampler2D tex2;

void main()
{
    FragColor = mix(texture(tex1, TexCoord), texture(tex2, TexCoord), 0.2);
}
```

Specify different texture unit for two textures

```cpp linenums="1"
/* Create, Load Texture */
/* ... */
glUseProgram(shader);
// Set Texture units
glUniform1i(glGetUniformLocation(shader, "tex1"), 0);
glUniform1i(glGetUniformLocation(shader, "tex2"), 1);

while(...)
{
    /* ... */

    glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_2D, texture1);
    glActiveTexture(GL_TEXTURE1);
    glBindTexture(GL_TEXTURE_2D, texture2);

    glBindVertexArray(VAO);
    glDrawElements(GL_TRIANGLES, 6, GL_UNSIGNED_INT, 0);
}
```
