extends Control

var gameboyActions: Array[String]

var menu: PackedScene

func _ready() -> void:
	
	
	
	for i in InputMap.get_actions():
		if not "ui_" in i:
			gameboyActions.append(i)

func _input(_event: InputEvent) -> void:
	if $"..".visible:
		for i in gameboyActions:
			if Input.is_action_just_pressed(i):
				if get_tree():
					
					menu = preload("res://Main Menu/Level Select/level_select.tscn")
					get_tree().change_scene_to_file("res://Main Menu/Level Select/level_select.tscn")
					
					#get_tree().change_scene_to_packed(menu)
				else:
					print("Node is not currently inside the active SceneTree!")
			else:
				return
