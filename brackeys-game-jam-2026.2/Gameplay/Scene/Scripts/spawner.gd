extends Node2D

@export var NPC_scene: PackedScene
@export var player_scene: PackedScene

@export var area: Vector4

@export var players: int = 50

func _ready() -> void:
	if player_scene:
		var player: CharacterBody2D = player_scene.instantiate()
		
		player.global_position = Vector2(randf_range(area.x, area.z + area.x), randf_range(area.y, area.w + area.y))
		
		add_child(player)
	else:
		push_error("No Player scene given")
	
	await get_tree().physics_frame
	
	if NPC_scene:
		for i in range(players - 1):
			var npc: CharacterBody2D = NPC_scene.instantiate()
			
			npc.global_position = Vector2(randf_range(area.x, area.z + area.x), randf_range(area.y, area.w + area.y))
			
			add_child(npc)
	else:
		push_error("No NPC scene given")
		
	
