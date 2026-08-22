extends Node

var spinning = false

var points = 0

var waiting = false

func _ready() -> void:
	print($AspectRatioContainer/Control2/TextureRect.global_position)

func _on_screen(node: Control):
	if node.global_position.x > get_window().size.x:
		return false
	elif node.global_position.x + node.size.x < 0:
		return false
	
	return true

func _unhandled_input(event: InputEvent) -> void:
	#if _on_screen($AspectRatioContainer/Control2/TextureRect):
	if _on_screen($AspectRatioContainer/Control2/TextureRect):
		print("YOU LOSE!!!")
	
	
	if event.is_action_pressed("ui_left") and not spinning:
		spinning = true
		$AnimationPlayer.speed_scale = 2.0
		$AnimationPlayer.play("Spin")
		await $AnimationPlayer.animation_finished
		spinning = false
		
		points += 10
		
		$Label.text = "Points: " + str(points)
		
		$AnimationPlayer.play("RESET")
	
	if event.is_action_pressed("ui_right") and not spinning:
		spinning = true
		$AnimationPlayer.speed_scale = 2.0
		$AnimationPlayer.play_backwards("Spin")
		await $AnimationPlayer.animation_finished
		spinning = false
		
		points += 10
		
		$Label.text = "Points: " + str(points)
		
		$AnimationPlayer.play("RESET")
#
#func _process(delta: float) -> void:
	#if Input.is_action_just_pressed("ui_accept"):
		#$AnimationPlayer.play("Spin", -1, 2)
		#$AnimationPlayer.seek(0, false)

func _physics_process(delta: float) -> void:
	if _on_screen($AspectRatioContainer/Control2/TextureRect):
		$AspectRatioContainer/Control2/TextureRect.position.x -= 5
	elif not waiting:
		waiting = true
		await get_tree().create_timer(randf_range(5, 10)).timeout
		$AspectRatioContainer/Control2/TextureRect.position.x = 892.0
		waiting = false
