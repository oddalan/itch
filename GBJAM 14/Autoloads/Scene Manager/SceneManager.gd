extends Node

func change_scene_by_path(path: String):
	call_deferred("_deferred_path_change", path)

func _deferred_path_change(path: String):
	var current_scene = get_tree().current_scene
	
	if current_scene:
		current_scene.free()
	
	var next_scene_load: PackedScene = load(path)
	if next_scene_load:
		var next_scene_node = next_scene_load.instantiate()
		
		get_tree().root.add_child(next_scene_node)
		get_tree().current_scene = next_scene_node
		
	else:
		assert(next_scene_load == null, "Next scene doesn't exist.")
