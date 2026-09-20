@tool
extends ColorRect

@export var palette: Array[GradientTexture1D] = []

@export_range(0, 1) var contrast_dial = 0.5:
	set(value):
		contrast_dial = value
		
		var mat: ShaderMaterial = material
		
		var color_1 = palette[0].gradient.sample(value)
		var color_2 = palette[1].gradient.sample(value)
		var color_3 = palette[2].gradient.sample(value)
		var color_4 = palette[3].gradient.sample(value)
		
		mat.set_shader_parameter("replace_colors", [color_1, color_2, color_3, color_4])
		
		

func _ready() -> void:
	if Engine.is_editor_hint():
		show()

func _process(_delta: float) -> void:
	if not Engine.is_editor_hint():
		if Input.is_action_pressed("Contrast Dial Up"):
			contrast_dial += 0.01
		if Input.is_action_pressed("Contrast Dial Down"):
			contrast_dial -= 0.01
