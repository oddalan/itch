extends Control

func _ready() -> void:
	
	
	%Yes.grab_focus()



func full_screen_yes() -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	%Animations.play("Fullscreen hide")


func full_screen_no() -> void:
	%Animations.play("Fullscreen hide")
