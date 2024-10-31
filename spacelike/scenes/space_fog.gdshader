shader_type canvas_item;

uniform float speed = 0.05;  // Speed of the fog movement
uniform float fog_opacity = 0.3;  // Overall opacity of the fog
uniform vec2 direction = vec2(1.0, 0.0);  // Direction the fog moves

void fragment() {
    // Calculate UV offset to create the rolling effect
    vec2 uv = UV;
    uv += direction * TIME * speed;

    // Sample the texture
    vec4 tex_color = texture(TEXTURE, uv);
    
    // Output the final color with adjusted opacity
    COLOR = vec4(tex_color.rgb, tex_color.a * fog_opacity);
}