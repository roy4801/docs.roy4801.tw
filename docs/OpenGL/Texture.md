# Texture

* Bind texture
```
// >= OpenGL 4.5
glBindTextureUnit(unit, texture)
// < OpenGL 4.5
glActiveTexture(GL_TEXTURE0 + unit);
glBindTexture(GL_TEXTURE_2D, texture);
```