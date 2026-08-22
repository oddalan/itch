shader_type canvas_item;

uniform vec4 color1: source_color;
uniform vec4 dark_color: source_color;

uniform vec2 size = vec2(1, 1);

uniform sampler2D mid_texture : repeat_enable, filter_nearest;

void fragment() {
	//vec4 color = texture(TEXTURE)
	float color_value = (COLOR.r + COLOR.g + COLOR.b) / 3.0;
	
	
	if (color_value > 0.666) {
		COLOR = color1;
	}
	
	if (color_value < 0.333) {
		COLOR = dark_color;
	}
	
	if (color_value > 0.333 && color_value < 0.666) {
		COLOR = texture(mid_texture, UV * size);
		
	}
	
	//COLOR = texture(mid_texture, UV * size);
	
}