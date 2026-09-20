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
	
	await get_tree().create_timer(0.2).timeout
	
	text = "One way is to get gold. Maybe try that."
	
	for letter in text:
		$Phone/Screen/Content/Browser/Answer.text += letter
		await get_tree().create_timer(randf_range(0.005, 0.035)).timeout
	
	await get_tree().create_timer(1.5).timeout
	
	get_tree().call_deferred("change_scene_to_file", "res://Main Menu/Level Select/level_select.tscn")
	
	
