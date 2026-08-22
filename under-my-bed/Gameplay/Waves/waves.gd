extends Node2D

var wave: int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = true
	$"../Enemys".child_order_changed.connect(size_change)

func size_change():
	if $"../Enemys".get_children().size() == 0:
		
		#var mouse = preload("res://mouse/mouse.tscn").instantiate()
		#mouse.name = "Mouse"
		#add_child(mouse)
		
		wave += 1
		
		if not ResourceLoader.exists("res://Gameplay/Waves/" + str(wave) + "/wave " + str(wave) + ".tscn"):
			get_tree().change_scene_to_file("res://Cutscenes/Outro/Win/outro_win.tscn")
			return
		
		$"../Player".running = false
		
		
		
		$ColorRect/Label.text = "Wave " + str(wave)
		
		await get_tree().create_timer(0.5).timeout
		show()



func _on_button_pressed() -> void:
	#$Mouse.queue_free()
	await get_tree().create_timer(0.01).timeout
	
	
	$"../Player".running = true
	$"../Player".position = Vector2(0, 0)
	hide()
	get_tree().paused = false
	
	
	
	var path  = "res://Gameplay/Waves/" + str(wave) + "/wave " + str(wave) + ".tscn"
	var load_node  = load(path)
	var scene = load_node.instantiate()
	$"../Enemys".add_child(scene)
