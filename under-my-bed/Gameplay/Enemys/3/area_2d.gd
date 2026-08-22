extends Area2D


func body_entered(body: Node2D) -> void:
	
	if body.name == "Player":
		body.hit()
	if body.name == "Walls":
		#print(body.name)
		$"..".queue_free()
