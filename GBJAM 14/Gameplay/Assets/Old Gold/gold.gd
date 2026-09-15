extends Area2D

var has_finished = false

func enter(body: Node2D) -> void:
	if body.name == "Player" and not has_finished:
		
		has_finished = true
		
		$AnimatedSprite2D.play()
		await $AnimatedSprite2D.animation_finished
		
		get_tree().change_scene_to_file("res://Main Menu/Level Select/level_select.tscn")
		
		
		
		
