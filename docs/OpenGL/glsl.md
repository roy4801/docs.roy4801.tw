# OpenGL GLSL

## Data Type

GLSL 有C語言及其他語言大多都有的 type:`int`, `float`, `double`, `uint`, `bool`，另位還有兩種容器 type: 向量(Vector)跟矩陣(Matrix)

* 向量
    * 可以有 $[1, 4]$ 個分量
    * `vecn` 包含 $n$ 個 `float`
    * `bvecn` 包含 $n$ 個 `bool`
    * `ivecn` 包含 $n$ 個 `int`
    * `uvecn` 包含 $n$ 個 `unsigned int`
    * `dvecn` 包含 $n$ 個 `double`

* 分量用 `.x`, `.y`, `.z`, `.w` 來存取分量，或是`rgba`(顏色)跟`stpq`(材質)來存取。

* 重組(Swizzling)
    * 可以用分量的組合來建立新的 vec
    ```glsl
    vec2 someVec;
    vec4 differentVec = someVec.xyxx;
    vec3 anotherVec = differentVec.zyw;
    vec4 otherVec = someVec.xxxx + anotherVec.yxzy;
    ```

## Input & Output

GLSL 可以用 `in`, `out` 來標示一個變數是傳入還是傳出，上個 Shader 所指定的 `out` 會對應到下個 Shader 所指定的 `in` 變數，名稱要相同。

* Vertex Shader
```glsl
#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aColor;

out vec3 ourColor; // 輸出到 Fragment Shader

void main() {
    gl_Position = vec4(aPos, 1.0);
    ourColor = aColor;
}
```
* Fragment Shader
```glsl
#version 330 core
in vec3 ourColor;   // 從 Vertex Shader 輸入的顏色，名稱要一樣

out vec4 FragColor;

void main() {
    FragColor = ourColor;    
}
```

## Uniform

Uniform 是 CPU 向 GPU 的 Shader 發送數據的方式，但跟 Vertex Attribute 有點不同。
Uniform 可以在**所有的 Shader 中存取**，而不用像 Vertex Attribute 是要用 `in`, `out` 傳資料，意思是 Uniform 是 Global 的變數，它必須是 **獨特的(Unique)** 的。

```glsl
#version 330 core
out vec4 FragColor;

uniform vec4 ourColor; // 在 Code 中傳入

void main()
{
    FragColor = ourColor;
}
```

!!!warning
	如果宣告了一個 `uniform` 卻沒有使用，編譯器可能會移除該變數，導致在最後編譯出的版本不會包含它

* 傳入 uniform
    * 使用 [`glGetUniformLocation()`](http://docs.gl/gl4/glGetUniformLocation) 以及 [`glUniform4f()`](http://docs.gl/gl4/glUniform)
    ```cpp
    float green = /* expression for calculating green */;
    // 查詢 ourColor 的位置
    int vertexColorLocation = glGetUniformLocation(shaderProgram, "ourColor");
    // 啟用 shader
    glUseProgram(shaderProgram);
    // 傳入 ourColor 的值 (vec4)
    glUniform4f(vertexColorLocation, 0.0f, green, 0.0f, 1.0f);
    ```

!!!info
	因為 OpenGL 是 C 的 Library，所以不支援 Overloading

	| 後綴 | 意義 |
	| -------- | -------- |
	| `f` | float |
	| `i` | int |
	| `ui` | unsigned int |
	| `3f` | 三個 float |
	| `fv` | array of float |
