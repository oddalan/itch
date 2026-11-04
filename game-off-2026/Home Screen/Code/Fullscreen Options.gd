extends Control

func _ready() -> void:
	
	
	%Yes.grab_focus()



func full_screen_yes() -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)


func full_screen_no() -> void:
	pass # Replace with function body.
