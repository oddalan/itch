extends Control



func play() -> void:
	get_tree().change_scene_to_file("res://Gameplay/Scene/Levels/1/Cutscene.tscn")


func show_or_hide() -> void:
	if visible:
		%Play.grab_focus()
