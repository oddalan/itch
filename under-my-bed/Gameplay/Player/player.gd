extends CharacterBody2D

@export var running = true

@export var speed = 5.0
@export var multiplier = 1000.0

@export var max_spin_scale = 1.0

@export var spin_velocity = 4.0

@export var min_speed = 0.05

@onready var lives = 5

func _ready() -> void:
	$Animation.play("Spin")

func _process(delta: float) -> void:
	if not running:
		multiplier = 1000.0
		
		var frame = floori($Animation.current_animation_position * 12)
		$Weapon.rotation = deg_to_rad(frame * 45)
		$Head.rotation = deg_to_rad(frame * 45)
	else:
		var velocity_var = Vector2(0, 0)
		
		if Input.is_action_pressed("ui_left"):
			velocity_var.x -= 1
		if Input.is_action_pressed("ui_right"):
			velocity_var.x += 1
		if Input.is_action_pressed("ui_up"):
			velocity_var.y -= 1
		if Input.is_action_pressed("ui_down"):
			velocity_var.y += 1
		
		if Input.is_action_pressed("ui_accept"):
			if multiplier > 0:
				multiplier -= spin_velocity
		else:
			if multiplier < 1000.0:
				multiplier += spin_velocity
		
		
		if velocity.x < min_speed:
			velocity.x = min_speed
		if velocity.x < min_speed:
			velocity.x = min_speed
		
		
		var spin_scale = ((1000.0 - multiplier) / 1000.0) * max_spin_scale * (delta * 100)
		$Animation.speed_scale = spin_scale
		
		var frame = floori($Animation.current_animation_position * 12)
		$Weapon.rotation = deg_to_rad(frame * 45)
		$Head.rotation = deg_to_rad(frame * 45)
		
		
		velocity = (velocity_var * (speed * multiplier)) * delta
		
		
		
		move_and_slide()

func hit():
	#print("hit")
	
	if not lives > 1:
		get_tree().paused = true
		await get_tree().create_timer(0.01).timeout
		get_tree().change_scene_to_file("res://Cutscenes/Outro/Lose/outro_lose.tscn")
	
	Input.start_joy_vibration(0, 1.0, 1.0, 0.75)
	
	get_node("../Stats/Life " + str(lives)).queue_free()
	lives -= 1
	#print(lives)
