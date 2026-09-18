extends Area2D

var dir = Vector2(0, 1)
var speed = 0.0



func _process(delta: float) -> void:
	position += dir * speed * delta
	if $Left.is_colliding():
		if $Left.get_collider() == %Player:
			$Collision.call_deferred("set_disabled", false)
			$StaticBody/Collision.call_deferred("set_disabled", true)
			
			speed = 50

func _on_body_entered(body: Node2D) -> void:
	if body == %Player:
		%Player.die()
