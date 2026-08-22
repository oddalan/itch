extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in get_children():
		if "Enemy" in i.name:
			i.target_node = $"../../Player"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_children().size() == 0:
		queue_free()
