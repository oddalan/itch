extends Node2D

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") and get_parent().team == 1:
		$Attack.show()
		await get_tree().create_timer(0.1).timeout
		$Attack.hide()
	
	if $Attack.get_overlapping_bodies().size() > 0 and $Attack.visible == true:
		for body in $Attack.get_overlapping_bodies():
			#await get_tree().create_timer(5).timeout
			if body:
				if not body.name == "Playable" and not "TileMapLayer" in body.name:
					
					body.team = 1
