shader_type canvas_item;

render_mode unshaded;

uniform vec4 target_colors[20] : source_color;
uniform vec4 replace_colors[20] : source_color;
uniform int color_count : hint_range(0, 20); // number of active color swaps
uniform float tolerance : hint_range(0, 1);
uniform bool shader_active = true; // you’ll change this from your script

uniform sampler2D screen_texture : hint_screen_texture, filter_linear_mipmap;

void fragment() {
	vec4 tex_color = texture(screen_texture, SCREEN_UV);

	if (shader_active) {
		for (int i = 0; i < color_count; i++) {
			if (distance(tex_color.rgb, target_colors[i].rgb) < tolerance) {
				tex_color.rgb = replace_colors[i].rgb;
				break;
			}
		}
	}
	COLOR = tex_color;
}