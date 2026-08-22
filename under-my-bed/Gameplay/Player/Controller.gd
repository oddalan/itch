extends Node

func _ready() -> void:
	print(OS.get_name())
	if OS.has_feature("web_android") or OS.has_feature("web_ios"):
		print("Phone or Tablet")
		$Node2D.show()
		$Node2D2.show()
	else:
		print("PC or Mac")
		$Node2D.hide()
		$Node2D2.hide()

func _on_right_button_down() -> void:
	var event = InputEventAction.new()
	event.action = "ui_right"
	event.pressed = true
	
	Input.parse_input_event(event)
func _on_right_button_up() -> void:
	var event = InputEventAction.new()
	event.action = "ui_right"
	event.pressed = false
	
	Input.parse_input_event(event)

func _on_left_button_down() -> void:
	var event = InputEventAction.new()
	event.action = "ui_left"
	event.pressed = true
	
	Input.parse_input_event(event)
func _on_left_button_up() -> void:
	var event = InputEventAction.new()
	event.action = "ui_left"
	event.pressed = false
	
	Input.parse_input_event(event)

func _on_up_button_down() -> void:
	var event = InputEventAction.new()
	event.action = "ui_up"
	event.pressed = true
	
	Input.parse_input_event(event)
func _on_up_button_up() -> void:
	var event = InputEventAction.new()
	event.action = "ui_up"
	event.pressed = false
	
	Input.parse_input_event(event)

func _on_down_button_down() -> void:
	var event = InputEventAction.new()
	event.action = "ui_down"
	event.pressed = true
	
	Input.parse_input_event(event)
func _on_down_button_up() -> void:
	var event = InputEventAction.new()
	event.action = "ui_down"
	event.pressed = false
	
	Input.parse_input_event(event)


func _on_hit_button_down() -> void:
	var event = InputEventAction.new()
	event.action = "ui_accept"
	event.pressed = true
	
	Input.parse_input_event(event)
func _on_hit_button_up() -> void:
	var event = InputEventAction.new()
	event.action = "ui_accept"
	event.pressed = false
	
	Input.parse_input_event(event)
