extends TextureRect

var mainScene = false

func _ready() -> void:
	if get_tree().current_scene.name == "Work":
		mainScene = true

func _physics_process(delta: float) -> void:
	
	if %CharacterBody2D.global_position.y > global_position.y + 40:
		z_index = 0
	if %CharacterBody2D.global_position.y < global_position.y + 40:
		z_index = 2
