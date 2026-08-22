extends Node

@export var stream = preload("res://Sound Effects/music/_Under my Bed_ Title Screen.mp3"):
	set(value):
		$AudioStreamPlayer2D.playing = false
		$AudioStreamPlayer2D.stream = value
		$AudioStreamPlayer2D.playing = true
