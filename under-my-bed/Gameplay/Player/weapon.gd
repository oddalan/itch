extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if not body.name == "Player":
		#print(body.name)
		if "Enemy" in body.name:
			body.queue_free()
			
			Input.start_joy_vibration(0, 0.2, 0.4, 0.1)
			
			var sound = AudioStreamPlayer2D.new()
			sound.stream = load("res://Sound Effects/poof.wav")
			
			add_child(sound)
			
			sound.volume_db = 2.5
			sound.playing = true
			
			await sound.finished
			sound.queue_free()
