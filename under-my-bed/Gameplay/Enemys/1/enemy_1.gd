extends CharacterBody2D

@export var target_node: CharacterBody2D
@export var speed = 1000.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:



	var dir = global_position.direction_to(target_node.global_position)
	velocity = dir * speed * delta
	move_and_slide()
