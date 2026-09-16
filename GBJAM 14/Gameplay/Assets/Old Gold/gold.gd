extends Area2D

var save_file = "res://Save Data/Save.txt"

var has_finished = false

func enter(body: Node2D) -> void:
	if body.name == "Player" and not has_finished:
		
		has_finished = true
		
		var file = FileAccess.open(save_file, FileAccess.WRITE)
		if file:
			var split_string = get_tree().current_scene.scene_file_path.split("/")
			
			var data = str(int(split_string[4]) + 1)
			
			file.store_string(data)
		
		$AnimatedSprite2D.play()
		await $AnimatedSprite2D.animation_finished
		
		get_tree().change_scene_to_file("res://Main Menu/Level Select/level_select.tscn")
