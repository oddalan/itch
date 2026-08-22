extends Node2D

func _ready() -> void:
	var global_audio: Node = get_tree().root.get_node("/root/GlobalAudio")
	var audio_player: AudioStreamPlayer2D = global_audio.get_node("AudioStreamPlayer2D")
	audio_player.playing = false
	audio_player.stream = preload("res://Sound Effects/music/Gameplay (Aug 6, 2026 1_34 PM)-2.mp3")
	audio_player.playing = true
	
	audio_player.volume_db = 1.0
