extends Node2D

func _ready() -> void:
	scene_switch(Node.new())
	
	
	get_tree().root.child_entered_tree.connect(scene_switch)

func scene_switch(node: Node):
	var file_path: String = get_tree().current_scene.scene_file_path
	var file_basename = file_path.get_file().get_basename()
	
	print(file_basename)
	
	if file_basename == "Main Menu" or file_basename == "Outro":
		$AudioStreamPlayer.play()
		return
		
	if file_basename == "Intro" or file_basename == "level_select":
		if $AudioStreamPlayer.playing:
			return
		else:
			$AudioStreamPlayer.play()
			return
	
	$AudioStreamPlayer.stop()
