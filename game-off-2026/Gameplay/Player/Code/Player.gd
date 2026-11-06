extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -200.0

@export var camera_start_pos: Vector2 = Vector2(0.0, 0.0)

@onready var camera_offset: Node2D = $"Reset/Camera Offset"

@onready var ignore_input_time: Timer = $"Ignore Input Time"

@onready var sounds: Node = $Sounds

func _ready() -> void:
	camera_offset.global_position = camera_start_pos

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		sounds.get_node("Jump").play()
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = JUMP_VELOCITY
	elif is_on_wall():
		if velocity.y > 0.0:
			velocity.y /= 1.25
		
		if Input.is_action_just_pressed("ui_accept"):
			velocity = ((get_wall_normal() * 0.5) + Vector2(0, -1)) * -JUMP_VELOCITY
			$"Ignore Input Time".start()
			
			return
	elif velocity.y < 0.0:
		if Input.is_action_just_released("ui_accept"):
			velocity.y *= 0.25

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if ignore_input_time.is_stopped():
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	camera_offset.global_position = lerp(camera_offset.global_position, global_position, 5 * delta)
	
