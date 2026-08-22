extends Node2D

var is_full = false
#func _ready() -> void:
	#var global_audio: Node = get_tree().root.get_node("/root/GlobalAudio")
	#var audio_player: AudioStreamPlayer2D = global_audio.get_node("AudioStreamPlayer2D")
	#audio_player.playing = false
	#audio_player.stream = preload("res://Sound Effects/music/_Under my Bed_ Title Screen.mp3")
	#audio_player.playing = true
	#
	#audio_player.volume_db = 0.0


func play() -> void:
	get_tree().change_scene_to_file("res://Cutscenes/Intro/intro.tscn")

func meta(meta: Variant) -> void:
	OS.shell_open(meta)

func credits() -> void:
	get_tree().change_scene_to_file("res://Credits/credits.tscn")

func _on_fullscreen_pressed() -> void:
	is_full = not is_full
	if is_full:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
