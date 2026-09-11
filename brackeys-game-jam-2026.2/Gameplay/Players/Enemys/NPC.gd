extends CharacterBody2D

@export var color_palette: Array[Color]



func update_target(value):
	await get_tree().physics_frame
	
	var nav_map = get_world_2d().navigation_map
	if value == 1:
		$NavigationAgent2D.target_position = NavigationServer2D.map_get_closest_point(nav_map, target_node.global_position)
	else:
		$NavigationAgent2D.target_position = NavigationServer2D.map_get_closest_point(nav_map, Vector2(randf_range(get_parent().area.x, get_parent().area.z + get_parent().area.x), randf_range(get_parent().area.y, get_parent().area.w + get_parent().area.y)))

@export var team: int = 1:
	set(value):
		update_target(value)
		team = value
		$Team.text = str(value)

@export var speed: float = 2500.0

@onready var target_node = get_parent().get_children().pick_random():
	set(value):
		if value == self:
			print("ME")
			target_node = get_parent().get_children().pick_random()
		else:
			target_node = value

func _ready() -> void:
	await get_tree().physics_frame
	
	team = randi_range(1, 4)
	
	
	var mat: ShaderMaterial = $Texture.material
	
	mat = mat.duplicate()
	
	mat.set_shader_parameter("replace_colors", [color_palette[randi_range(0, color_palette.size() - 1)]])
	
	
	
	$Texture.material = mat

func _physics_process(delta: float) -> void:
	if global_position.distance_to($NavigationAgent2D.target_position) < 8:
		
		update_target(team)
		
		#if team == 1:
			#target_node = get_parent().get_children().pick_random()
		#else:
			#$NavigationAgent2D.target_position = Vector2(randf_range(get_parent().area.x, get_parent().area.z + get_parent().area.x), randf_range(get_parent().area.y, get_parent().area.w + get_parent().area.y))
	
	if team == 1:
		$NavigationAgent2D.target_position = target_node.global_position
	
	
	
	var dir = to_local($NavigationAgent2D.get_next_path_position()).normalized()
	velocity = dir * speed * delta
	
	if velocity.y > 0.0:
		$"Animation Player".play("walk up")
	if velocity.y < 0.0:
		$"Animation Player".play("walk down")
	if velocity.x > 0.0:
		$"Animation Player".play("walk right")
	if velocity.x < 0.0:
		$"Animation Player".play("walk left")
	
	
	move_and_slide()
