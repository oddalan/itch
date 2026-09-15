extends Area2D



func enter(body: Node2D) -> void:
	if body == %Player:
		%Player.die()
