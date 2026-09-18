extends Node2D

func _ready() -> void:
	$Phone/Screen/Content.hide()
	$Phone/Screen.color = Color("#405010")
	
	var balloon: DialogueResource = preload("res://Cut Scenes/Intro/Intro.dialogue")
	DialogueManager.show_dialogue_balloon(balloon)
	
	await DialogueManager.dialogue_ended
	
	$Phone/Screen.color = Color("#a0a840")
	
	$Phone/Screen/Content.show()
	
	var text = "good ways to make money"
	
	for letter in text:
		$Phone/Screen/Content/Browser/Text.text += letter
		await get_tree().create_timer(randf_range(0.01, 0.07)).timeout
	
	$"Phone/Screen/Content/Browser/Text/Animation Player".play("Go Up")
