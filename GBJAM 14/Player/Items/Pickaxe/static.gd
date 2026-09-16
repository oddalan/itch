extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body == %Player:
		print("Pickaxe")
		hide()
		%Player.has_pickaxe = true
