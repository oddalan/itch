extends Area2D

func enter(body):
	#print($"..".visible)
	if body.name == "Player" and $"..".visible:
		print("Player")
		body.hit()
		$"..".queue_free()
