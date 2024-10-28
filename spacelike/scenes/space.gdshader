shader_type canvas_item;

uniform float twinkle_speed = 1.0;    // Control how fast stars twinkle
uniform float twinkle_intensity = 0.5; // Max intensity of the twinkle effect

void fragment() {
    vec2 uv = FRAGCOORD.xy / SCREEN_PIXEL_SIZE;

    // Generate a star brightness variation based on time and position
    float star_brightness = sin(TIME * twinkle_speed + uv.x * 10.0 + uv.y * 5.0) * twinkle_intensity;

    // Clamp the brightness so stars don't completely disappear
    star_brightness = clamp(star_brightness, 0.1, 1.0);

    // Get the current texture color and apply twinkling effect to its alpha
    vec4 tex_color = texture(TEXTURE, UV);
    COLOR = vec4(tex_color.rgb, tex_color.a * star_brightness); // Adjust alpha for twinkle
}