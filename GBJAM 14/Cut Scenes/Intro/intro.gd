extends Node2D

func _ready() -> void:
	$Phone/Screen/Content.hide()
	
	var balloon: DialogueResource = preload("res://Cut Scenes/Intro/Intro.dialogue")
	DialogueManager.show_dialogue_balloon(balloon)
	
	await DialogueManager.dialogue_ended
	
	$Phone/Screen.color = Color("#a0a840")
	
	$Phone/Screen/Content.show()
