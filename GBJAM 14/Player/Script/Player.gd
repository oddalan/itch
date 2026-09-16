extends CharacterBody2D

@export var speed: float = 20.0

@export var jump_speed: float = 10.0

@export var fall_acceleration = 6.0
@export var max_fall = 60

var is_dead = false

@export var has_pickaxe = false

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		
		if velocity.y + fall_acceleration * delta < max_fall:
			velocity.y += fall_acceleration * delta
		
		
		if not is_dead:
			if velocity.y > 0:
				$AnimatedSprite2D.play("Fall")
			if velocity.y < 0:
				$AnimatedSprite2D.play("Jump")
			
	
	else:
		if Input.is_action_just_pressed("A"):
			velocity.y = jump_speed * delta
	
	if not is_dead:
		var dir: float = Input.get_axis("D-Left", "D-Right")
		
		if dir > 0:
			$AnimatedSprite2D.flip_h = false
			if is_on_floor() :
				#if Input.is_action_just_pressed("D-Right"):
					
					#$AudioStreamPlayer.play()
				$AnimatedSprite2D.play("Run")
		if dir < 0:
			$AnimatedSprite2D.flip_h = true
			if is_on_floor() :
				#$AudioStreamPlayer.play()
				$AnimatedSprite2D.play("Run")
		if dir == 0:
			if is_on_floor() :
				#$AudioStreamPlayer.stop()
				$AnimatedSprite2D.play("Idle")
		
		velocity.x = (dir * speed) * delta
	
	
	
	move_and_slide()

func _ready() -> void:
	$CanvasLayer.hide()

func die():
	$CanvasLayer/Death/Death_SFX.play()
	
	print("DIE")
	is_dead = true
	
	$AnimatedSprite2D.play("Death")
	
	$CollisionShape2D.call_deferred("set_disabled", true)
	velocity.y = -100
	
	$AnimatedSprite2D.z_index = 50
	
	await get_tree().create_timer(3.0).timeout
	
	
	$CanvasLayer.show()
	$CanvasLayer/Death/Label/AnimationPlayer.play("Flash")
