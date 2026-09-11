extends Node2D

func _physics_process(delta: float) -> void:
	if $Attack.get_overlapping_bodies().size() > 0:
		#if $"..".team = 1:
			for i: Node in $Attack.get_overlapping_bodies():
				if i is CharacterBody2D:
					$"..".update_target($"..".team)
					
					%Spawner.get_node("Playable")
					
					i.team = 1
					if not i.name == "Playable":
						i.update_target(i.team)
				
				
