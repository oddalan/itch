extends CharacterBody2D

@export var speed: float = 20.0

@export var jump_speed: float = 10.0

@export var fall_acceleration = 6.0
@export var max_fall = 60

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		
		if velocity.y + fall_acceleration * delta < max_fall:
			velocity.y += fall_acceleration * delta
	
	else:
		if Input.is_action_just_pressed("A"):
			velocity.y = jump_speed * delta
			$AudioStreamPlayer.play()
	
	var dir: float = Input.get_axis("D-Left", "D-Right")
	
	if dir > 0:
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("Run")
	if dir < 0:
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("Run")
	if dir == 0:
		$AnimatedSprite2D.pause()
		$AnimatedSprite2D.frame = 0
	
	velocity.x = (dir * speed) * delta
	
	
	
	move_and_slide()
