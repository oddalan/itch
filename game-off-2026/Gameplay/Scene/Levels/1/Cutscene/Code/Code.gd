extends Node

func _ready() -> void:
	DialogueManager.line_changed.connect(update_line)
	
	DialogueManager.show_dialogue_balloon(preload("res://Gameplay/Scene/Levels/1/Cutscene/dialogue_file.dialogue"))

func update_line(line: String) -> void:
	print(line)
