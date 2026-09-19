extends Area2D

var is_in_gold = false
var gold: Area2D

func use_pickaxe():
	if Input.is_action_just_pressed("B") and is_in_gold and $"..".has_pickaxe:
		
		
		
		gold.hide()
		
		gold.get_node("Collision").call_deferred("set_disabled", true)
		gold.get_node("Static/Collision").call_deferred("set_disabled", true)

func _on_area_entered(area: Area2D) -> void:
	if "Gold" in area.name:
		is_in_gold = true
		
		gold = area
		
		print(area.name)


func _on_area_exited(area: Area2D) -> void:
	if "Gold" in area.name:
		is_in_gold = false
		
		print(area.name)
