extends Area2D

var save_file = "user://Save Data/Save.txt"

var has_finished = false

func enter(body: Node2D) -> void:
	#if body.name == "Player" and not has_finished:
		#
		#has_finished = true
		#
		#var file_write = FileAccess.open(save_file, FileAccess.WRITE)
		#var file_read  = FileAccess.open(save_file, FileAccess.READ)
		#
		#
		#if file_read:
			#var file_content = file_read.get_as_text()
			#file_read.close()
			#
			#
			#if file_write:
				#var split_string = get_tree().current_scene.scene_file_path.split("/")
				#
				#if int(split_string[4]) < int(file_content):
					#print("SAVE TOO LOW")
				#
				#var data = str(int(split_string[4]) + 1)
				#
				#file_write.store_string(data)
		#else:
			#if file_write:
				#var split_string = get_tree().current_scene.scene_file_path.split("/")
				#
				#var data = str(int(split_string[4]) + 1)
				#
				#file_write.store_string(data)
		#
		
		$AnimatedSprite2D.play()
		await $AnimatedSprite2D.animation_finished
		
		get_tree().change_scene_to_file("res://Main Menu/Level Select/level_select.tscn")
