extends CharacterBody2D

@export var speed: float = 4000.0

@export var team: int = 1

func update_points():
	%"Team 1".text = str(%"Team 1".text.to_int() + 1)

func _ready() -> void:
	$Team.text = str(team)

func _physics_process(delta: float) -> void:
	var dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	velocity = dir * delta * speed
	
	move_and_slide()
	
	if velocity.y > 0.0:
		$"Animation Player".play("walk down")
	
	if velocity.y < 0.0:
		$"Animation Player".play("walk up")
	
	if velocity.x < 0.0:
		$"Animation Player".play("walk left")
	
	if velocity.x > 0.0:
		$"Animation Player".play("walk right")
		
	if velocity == Vector2(0, 0):
		$"Animation Player".seek(0.0)
