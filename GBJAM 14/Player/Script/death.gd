extends Control

var gameboyActions: Array[String]

@export var menu: PackedScene

func _ready() -> void:
	for i in InputMap.get_actions():
		if not "ui_" in i:
			gameboyActions.append(i)

func _input(_event: InputEvent) -> void:
	if $"..".visible:
		for i in gameboyActions:
			if Input.is_action_just_pressed(i):
				get_tree().change_scene_to_packed(preload("res://Main Menu/Scene/Main Menu.tscn"))
