extends Area2D



func enter(body: Node2D) -> void:
	if body.name == "Player":
		$AnimatedSprite2D.play()
		await $AnimatedSprite2D.animation_finished
		$AnimatedSprite2D.stop()
