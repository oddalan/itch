extends Node

func _ready() -> void:
	get_tree().paused = true
	
	DialogueManager.line_changed.connect(update_line)
	
	DialogueManager.show_dialogue_balloon(preload("res://Gameplay/Scene/Levels/1/Cutscene/dialogue_file.dialogue"))
	
	await DialogueManager.dialogue_ended
	
	get_tree().paused = false
func update_line(line: String) -> void:
	print(line)
