extends CharacterBody2D

@export var SPEED = Vector2(500, 250)

func _physics_process(delta: float) -> void:
	var velocity_var = Vector2(0, 0)
	
	if Input.is_action_pressed("ui_left"):
		velocity_var.x -= 1
	if Input.is_action_pressed("ui_right"):
		velocity_var.x += 1
	if Input.is_action_pressed("ui_up"):
		velocity_var.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity_var.y += 1
	
	velocity = velocity_var * SPEED * delta
	move_and_slide()
	
	var position_str = ""
	
	if velocity_var.y == -1:
		position_str += "U"
	if velocity_var.y == 1:
		position_str += "D"
	
	if velocity_var.x == -1:
		position_str += "L"
	if velocity_var.x == 1:
		position_str += "R"
	
	if velocity_var.x == 0 and velocity_var.y == 0:
		$AnimationPlayer.pause()
		$AnimationPlayer.seek(0, true) 
		return
	
	if velocity_var.x == -1 and velocity_var.y == 0:
		$AnimationPlayer.play("Walk DL")
		return
	if velocity_var.x == 1 and velocity_var.y == 0:
		$AnimationPlayer.play("Walk DR")
		return
	
	$AnimationPlayer.play("Walk " + position_str)
