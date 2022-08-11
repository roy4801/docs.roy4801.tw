# OpenGL Transform

## 矩陣組合

多個變換矩陣可以用乘法融合到一個矩陣中。例如，先縮放兩倍、再位移$(1,2,3)$
矩陣乘法是從最右邊開始，依序往左乘，所以是最右邊的操作最先發生。

$$
Trans . Scale = \begin{bmatrix} \color{red}1 & \color{red}0 & \color{red}0 & \color{red}1 \\ \color{green}0 & \color{green}1 & \color{green}0 & \color{green}2 \\ \color{blue}0 & \color{blue}0 & \color{blue}1 & \color{blue}3 \\ \color{purple}0 & \color{purple}0 & \color{purple}0 & \color{purple}1 \end{bmatrix} . \begin{bmatrix} \color{red}2 & \color{red}0 & \color{red}0 & \color{red}0 \\ \color{green}0 & \color{green}2 & \color{green}0 & \color{green}0 \\ \color{blue}0 & \color{blue}0 & \color{blue}2 & \color{blue}0 \\ \color{purple}0 & \color{purple}0 & \color{purple}0 & \color{purple}1 \end{bmatrix} = \begin{bmatrix} \color{red}2 & \color{red}0 & \color{red}0 & \color{red}1 \\ \color{green}0 & \color{green}2 & \color{green}0 & \color{green}2 \\ \color{blue}0 & \color{blue}0 & \color{blue}2 & \color{blue}3 \\ \color{purple}0 & \color{purple}0 & \color{purple}0 & \color{purple}1 \end{bmatrix} \\
\begin{bmatrix} \color{red}2 & \color{red}0 & \color{red}0 & \color{red}1 \\ \color{green}0 & \color{green}2 & \color{green}0 & \color{green}2 \\ \color{blue}0 & \color{blue}0 & \color{blue}2 & \color{blue}3 \\ \color{purple}0 & \color{purple}0 & \color{purple}0 & \color{purple}1 \end{bmatrix} . \begin{bmatrix} x \\ y \\ z \\ 1 \end{bmatrix} = \begin{bmatrix} \color{red}2x + \color{red}1 \\ \color{green}2y + \color{green}2  \\ \color{blue}2z + \color{blue}3 \\ 1 \end{bmatrix}
$$

不同的操作之間可能相互影響，依照縮放、旋轉、位移的順序組合矩陣，否則操作間會相互影響

$$
M_{\text{transform}} = M_{\text{Translate}} \cdot M_{\text{Rotate}} \cdot M_{\text{Scale}}
$$

## GLM

![](https://i.imgur.com/i6OEkUH.png)

Open**GL** **M**athematics，是一個 header-only 的 OpenGL 數學函式庫

```cpp linenums="1"
glm::vec4 vec(1.0f, 0.0f, 0.0f, 1.0f);

glm::mat4 trans(1.0f);
trans = glm::translate(trans, glm::vec3(1.0f, 1.0f, 0.0f));
vec = trans * vec;
printf("%d %d %d\n", vec.x, vec.y, vec.z);
```

* 縮放 0.5 倍，逆時針選轉 90 度

```cpp linenums="1"
glm::mat4 trans;
trans = glm::rotate(trans, glm::radian(90.f), glm::vec3(0.0, 0.0, 1.0));
trans = glm::scale(trans, glm::vec3(0.5, 0.5, 0.5));
```

!!!danger
	最後在把 `trans` 跟點座標相乘時，是靠右的矩陣先跟點相乘，所以操作會是相反的
	在製作 `trans` 時是先旋轉再縮放，但是對於該點座標是先縮放再旋轉。

* 修改 Vertex Shader ，新增 `mat4`

```glsl linenums="1"
#version 450 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aVertColor;
layout (location = 2) in vec2 aTexCoord;

out vec3 VertColor;
out vec2 TexCoord;

uniform mat4 vTransform;

void main()
{
    gl_Position = vTransform * vec4(aPos, 1.0);
    TexCoord = aTexCoord;
    VertColor = aVertColor;
}
```

* 將矩陣傳到 Vertex Shader

```cpp linenums="1"
int transformLoc = glGetUniformLocation(program, "vTransform");
glUniformMatrix4fv(transformLoc, 1, GL_FALSE, glm::value_ptr(trans));
```
