extends Area2D

@export var has_run = false

func _on_body_entered(body: Node2D) -> void:
	if not has_run:
		var dialog = preload("res://Gameplay/Assets/Sign/Level 2/Level 2 sign dialogue.dialogue")
		if body.name == "Player":
			has_run = true
			DialogueManager.show_dialogue_balloon(dialog, "start")
