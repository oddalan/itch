extends Node2D

var running = false
@export var timer = 0.0
@export var speed = 50

@export var target_node: CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(timer).timeout
	running = true

func _physics_process(delta: float) -> void:
	if running:

		position.y += speed * delta
