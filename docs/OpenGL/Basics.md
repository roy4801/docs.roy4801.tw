# OpenGL Basics

## Vertex Buffer Object (VBO)

```cpp linenums="1"
uint32_t vbo;
glGenBuffer(1, &vbo); // number, array to object id
glBindBuffer(GL_ARRAY_BUFFER, vbo); // 綁定
glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), GL_STATIC_DRAW); //傳輸資料
```

??? note "details"
	* 產生
	    * `glGenBuffers(GLsizei n, GLuint *buffer)`
		    * `n`: 要產生幾個緩衝物件
		    * `buffers`: 存產生出來的名字陣列
	* 綁定
	    * `glBindBuffer(GLenum target, GLuint buffer)`
		    * `target`: 綁定到哪種緩衝器的綁定點
		    * `buffer`: 要綁定緩衝物件名字

	* 分配儲存空間
	    * `glBufferData(GLenum target, GLsizeptr size, const GLvoid *data, GLenum usage)`
		    * `target`: 目前緩衝物件綁定到的目標
		    * `size`: 給定緩衝物件的大小
		    * `data`: 要存入資料的 pointer
		    * `usage`: 設定存入資料的使用方式

	| Usage | 描述 |
	| -------- | -------- | 
	| `STATIC`   | 資料只被設定一次，但會被使用很多次 |
	| `DYNAMIC`  | 資料被改變很多次，也被使用很多次 |
	| `STREAM`   | 資料每次繪製都會改變 |

## Specify Vertex Attributes

![](https://i.imgur.com/edtm6a4.png)

```cpp linenums="1"
glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 3*sizeof(float), (void*)0);
glEnableVertexAttribArray(0);
```

??? note "Explaination of [`glVertexAttribPointer()`](https://docs.gl/gl4/glVertexAttribPointer)"
	* `index` 屬性的 index
	    * 可以在 Shader 中指定 `layout (location = #)`，在程式中可以用 [`glGetAttribLocation()`](http://docs.gl/gl4/glGetAttribLocation) 拿到 index
	    * 或是使用 `glBindAttribLocation()` 綁定

	* `size` 該頂點屬性(Attribute)的大小
	    * size $\in [1, 4]$
	    * 範例是 `vec3` 所以是 3

	* `type` 頂點屬性的型別
	    * `vec*` 是 float

	* `normalized` 是否 normalize
	    * `True` unsigned $[0, 1]$, signed $[-1, 1]$

	* `stride` 
	    * 一個 vertex 的大小
	    * $+$ `stride` bytes 會到下個 vertex 的同個資料

	* `pointer`
	    * 開頭的偏移量
	    * 一個 Vertex 可能會有多種 Attribute 資料

## Vertex Array Object (VAO)

![](https://i.imgur.com/0bPvnGF.png)

- VAOs can contain: VBO and EBO
	- bind vao first , and bind vbo, ebo
	- only need to bind vao in the future

- Create

```cpp
uint32_t vao;
glGenVertexArray(1, &vao);
glBindVertexArray(vao);
```

## Element Buffer Object (EBO)

![](https://i.imgur.com/ook5kIT.png)

- also called: Index Buffer Object (IBO)
- reduce the memory usage by using index for sharing common -vertices

```cpp linenums="1"
uint32_t indices[] = {
    {0, 1, 3}, // 第一個三角形
    {1, 2, 3}  // 第二個三角形
};
```

- Create and bind

```cpp linenums="1"
uint32_t ebo;
ebo = glGenBuffers(1, &ebo); // 建立
glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, ebo); // 綁定
glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(indices), indices, GL_STATIC_DRAW); // send data
```

- Draw

```cpp linenums="1"
glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, ebo);
glDrawElements(GL_TRIANGLES,  // 形狀
    6,               // 頂點數量
    GL_UNSIGNED_INT, // EBO 的 value type
    0                // offset
);
```

## Shader

- Whole process: Create -> Compile -> Linking -> Cleanup -> Use

- Create
	- Different shader?
		- vertex: `GL_VERTEX_SHADER`
		- fragment: `GL_FRAGMENT_SHADER`

```cpp linenums="1"
uint32_t vs;
vs = glCreateShader(GL_VERTEX_SHADER);
```

- Source and Compile

```cpp linenums="1"
glShaderSource(vs, 1, &src, nullptr);
glCompileShader(vs);
```

- Check compile status

```cpp linenums="1"
int success;
char log[512];
glGetShaderiv(shader, GL_COMPILE_STATUS, &success);
if(!success)
{
    glGetShaderInfoLog(shader, 512, nullptr, log);
    printf("Error Shader %s compile error\n%s\n", 
        type == GL_VERTEX_SHADER ? "Vertex" : "Fragment", log);
}
```

- Shader Program and Linking

```cpp linenums="1"
uint32_t shader;
shader = glCreateProgram();
glAttachShader(shader, vs); // vertex shader
glAttachShader(shader, fs); // fragment shader
glLinkProgram(shader);
// cleanup
glDeleteShader(vs);
glDeleteShader(fs);
```

- Check error

```cpp linenums="1"
bool ok;
char log[512];
glGetProgramiv(shader, GL_LINK_STATUS, &ok);
if(!ok)
{
	glGetProgramInfoLog(shader, 512, nullptr, log);
	printf("%s\n", log);
}
```

- Use shader

```cpp linenums="1"
glUseProgram(shader);
```

## Rendering

??? note "Without VAO"
	```cpp linenums="1"
	// 建立 VBO 複製頂點資料
	glBindBuffer(GL_ARRAY_BUFFER, VBO);
	glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
	// 設定頂點屬性
	glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 3 * sizeof(float), (void*)0);
	glEnableVertexAttribArray(0);
	// 使用 shader program
	glUseProgram(shaderProgram);
	// 畫東西
	glDrawArrays(GL_TRIANGLES, 0, 3);
	```

??? note "With VAO"
	```cpp linenums="1"
	// 建立並綁定 VAO
	glGenVertexArray(1, &VAO);
	glBindVertexArray(VAO);

	// 建立 VBO 複製頂點資料
	glBindBuffer(GL_ARRAY_BUFFER, VBO);
	glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);

	// 設定頂點屬性
	glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 3 * sizeof(float), (void*)0);
	glEnableVertexAttribArray(0);

	// 繪製
	glUseProgram(shaderProgram);
	glBindVertexArray(VAO);
	glDrawArrays(GL_TRIANGLES, 0, 3); // 三角形，從0開始，畫3個
	```

???+ note "With EBO & VAO"
	```cpp linenums="1"
	// 建立並綁定 VAO
	glGenVertexArray(1, &VAO);
	glBindVertexArray(VAO);

	// 建立 VBO 複製頂點資料
	glBindBuffer(GL_ARRAY_BUFFER, VBO);
	glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);

	// 建立 EBO 並複製
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, EBO);
	glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(indices), indices, GL_STATIC_DRAW);

	// 設定頂點屬性
	glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 3 * sizeof(float), (void*)0);
	glEnableVertexAttribArray(0);

	// 繪製
	glUseProgram(shaderProgram);
	glBindVertexArray(VAO);
	glDrawElements(GL_TRIANGLES, 6, GL_UNSIGNED_INT, 0);
	// 三角形，畫6個，EBO的type，從0開始
	```
