extends Area2D

var has_been_entered = false

func enter(body: Node2D) -> void:
	if body == %Player and not has_been_entered:
		has_been_entered = true
		$Animation.play("Area Entered")
