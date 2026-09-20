extends Node2D



func _ready() -> void:
	await get_tree().create_timer(0.2).timeout
	DialogueManager.show_dialogue_balloon(preload("res://Cut Scenes/Outro/Outro.dialogue"))
	await DialogueManager.dialogue_ended
	
	await get_tree().create_timer(0.5).timeout
	
	$AnimatedSprite2D/AnimationPlayer.play("Drive")
