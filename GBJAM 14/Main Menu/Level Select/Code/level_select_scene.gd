extends Control
class_name CitySelect

@onready var current_city: City = $"Levels/1"


func _ready() -> void:
	$Player.global_position = current_city.global_position

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("D-Left") and current_city.next_level_left:
		var file = FileAccess.open("res://Save Data/Save.txt", FileAccess.READ)
		var content = file.get_as_text()
		file.close()
		
		if int(current_city.next_level_left.city_index)  < int(content) + 1:
			current_city = current_city.next_level_left
			$Player.global_position = current_city.global_position
		
	if event.is_action_pressed("D-Right") and current_city.next_level_right:
		var file = FileAccess.open("res://Save Data/Save.txt", FileAccess.READ)
		var content = file.get_as_text()
		file.close()
		
		if int(current_city.next_level_right.city_index)  < int(content) + 1:
			current_city = current_city.next_level_right
			$Player.global_position = current_city.global_position
		
	if event.is_action_pressed("D-Down") and current_city.next_level_down:
		var file = FileAccess.open("res://Save Data/Save.txt", FileAccess.READ)
		var content = file.get_as_text()
		file.close()
		
		if int(current_city.next_level_down.city_index)  < int(content) + 1:
			current_city = current_city.next_level_down
			$Player.global_position = current_city.global_position
		
	if event.is_action_pressed("D-Up") and current_city.next_level_up:
		var file = FileAccess.open("res://Save Data/Save.txt", FileAccess.READ)
		var content = file.get_as_text()
		file.close()
		
		if int(current_city.next_level_up.city_index)  < int(content) + 1:
			current_city = current_city.next_level_up
			$Player.global_position = current_city.global_position
	
	if Input.is_action_just_pressed("Select") or Input.is_action_just_pressed("A"):
		if current_city.scene:
			get_tree().change_scene_to_packed(current_city.scene)
