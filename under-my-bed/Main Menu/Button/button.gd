extends Button

func _ready() -> void:
	button_down.connect(click)

func click():
	print("click")
	var sound_player = AudioStreamPlayer2D.new()
	sound_player.stream = preload("res://Sound Effects/click.wav")
	
	add_child(sound_player)
	sound_player.name = "sound"
	
	sound_player.volume_db = 1.5
	
	sound_player.playing = true
