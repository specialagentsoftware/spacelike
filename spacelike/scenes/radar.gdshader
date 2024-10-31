shader_type canvas_item;

uniform vec4 radar_color = vec4(0.0, 1.0, 0.0, 1.0); // Color tint for everything on the minimap
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

void fragment() {
    // Get the base content of the viewport
    vec4 base_texture = texture(SCREEN_TEXTURE, SCREEN_UV);

    // Apply the radar color tint, preserving the alpha
    vec4 tinted = vec4(radar_color.rgb * base_texture.rgb, base_texture.a);

    // Output the tinted color
    COLOR = tinted;
}
