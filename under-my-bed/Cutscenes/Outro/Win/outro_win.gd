extends Node2D

var isbbcode = false

var texts = [
	["Congratulations! You completed the game called, \"Under my Bed\".", Vector2(56.0, 57.0)],
	["This game is my entry for the \"B1T Jam\", august 2026. Thank you for trying\nmy jam entry!", Vector2(56.0, 62.0)],
	["If you would like to play again, click [url=res://Gameplay/Gameplay.tscn]HERE[/url].", Vector2(56.0, 57.0)],
	["At this time I have no other Game Jams, but I have other ones planed so please keep an eye on my profile if you liked this one.", Vector2(56.0, 72.0)],
	["The sound effects for this game where found on [url=https://freesound.org]freesound (url)[/url].", Vector2(56.0, 57.0)],
	["The Fonts for this game where found on\n[url=https://www.fontspace.com/]fontspace (url)[/url].", Vector2(56.0, 57.0)],
	["This Game was made in [url=https://godotengine.org/]Godot (url)[/url].", Vector2(56.0, 52.0)],
	["Taking you to the main menu.", Vector2(56.0, 52.0)]
]

func _ready() -> void:
	get_tree().paused = false
	
	$RichTextLabel.text = ""
	$Button.hide()
	
	for text in texts:
		for letter in text[0]:
			$RichTextLabel.text += letter
			if letter == "[":
				isbbcode = true
			if not isbbcode:
				await get_tree().create_timer(0.05).timeout
			if letter == "]":
				isbbcode = false
		
		$Button.position = text[1]
		$Button.show()
		
		await $Button.pressed
		
		$Button.hide()
		$RichTextLabel.text = ""
	
	var global_audio: Node = get_tree().root.get_node("/root/GlobalAudio")
	var audio_player: AudioStreamPlayer2D = global_audio.get_node("AudioStreamPlayer2D")
	audio_player.playing = false
	audio_player.stream = preload("res://Sound Effects/music/_Under my Bed_ Title Screen.mp3")
	audio_player.playing = true
	
	audio_player.volume_db = 1.0
	
	get_tree().change_scene_to_file("res://Main Menu/menu.tscn")



func meta(meta: Variant) -> void:
	print(meta)
	if meta.begins_with("http://") or meta.begins_with("https://"):
		OS.shell_open(meta)
	else:
		get_tree().change_scene_to_file(meta)
	


func _on_skip_button_pressed() -> void:
	var global_audio: Node = get_tree().root.get_node("/root/GlobalAudio")
	var audio_player: AudioStreamPlayer2D = global_audio.get_node("AudioStreamPlayer2D")
	audio_player.playing = false
	audio_player.stream = preload("res://Sound Effects/music/_Under my Bed_ Title Screen.mp3")
	audio_player.playing = true
	
	audio_player.volume_db = 1.0
	
	get_tree().change_scene_to_file("res://Main Menu/menu.tscn")
