extends Node2D

# states if the block is on by default
@export var running_on_default: bool = true

# holds the value for if the block is shifted on or off
var running: bool = true:
	set(value):
		$"Collision/Collision Shape".call_deferred("set_disabled", not value)
		
		if value:
			$Sprite.play("On")
		else:
			$Sprite.play("Off")
		
		running = value

# initializes the running variable
func _ready() -> void:
	while not is_inside_tree():
		pass
	$Timer.wait_time = $"../../../../Beat Counter".time_per_switch
	running = running_on_default

# called when the time ends
func shift() -> void:
	running = not running
