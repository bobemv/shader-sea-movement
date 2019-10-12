# Shader: Sea Movement
Exercise to learn Unity shader fundamentals: using a vertex shader to simulate a wave-like movement.

![](gifs/Shader_Sea_Movement.gif)

Things I have learnt/done:

- Very basic fundamentals for creating shaders: vertex and fragment shaders, basic information vertex shader can receive...
- Shader breakdown:
    - Rotation: achieved thanks to the Rotation Matrix in 3 axis: http://mathworld.wolfram.com/RotationMatrix.html
    - Wave: adding sin(|vector vertex|) to each vertex.
    - Wave movement: adding a little offset to the sin with _Time.

Thanks to @josemorval for guiding and helping me understand shaders :).

Nice article from Jordan Stevens about starting creating shaders: https://www.jordanstevenstechart.com/writing-shaders-in-unity

Texture used: https://assetstore.unity.com/packages/2d/textures-materials/floors/five-seamless-tileable-ground-textures-57060