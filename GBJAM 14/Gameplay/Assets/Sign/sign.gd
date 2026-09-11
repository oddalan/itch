extends Area2D


func _on_body_entered(body: Node2D) -> void:
	var dialog = preload("res://Gameplay/Assets/Sign/sign_dialogue.dialogue")
	if body.name == "Player":
		DialogueManager.show_dialogue_balloon(dialog, "start")
