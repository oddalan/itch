extends Node2D

var texts = [
	["This story is about a boy. His Dad, has told his Son, \"There are no monsters under your Bed!\" but is that really true?", Vector2(56.0, 67.0)],
	["The answer is, well no, but the boy believes his father. Thankfully the boy sleep walks. Or should i say, sleep fights.", Vector2(56.0, 67.0)],
	["To move, Use the ASDW or arrow keys. To swing your baseball bat, use the spacebar or Enter.", Vector2(56.0, 62.0)],
]

func _ready() -> void:
	$RichTextLabel.text = ""
	$Button.hide()
	
	for text in texts:
		for letter in text[0]:
			$RichTextLabel.text += letter
			await get_tree().create_timer(0.05).timeout
		$Button.position = text[1]
		$Button.show()
		
		await $Button.pressed
		
		$Button.hide()
		$RichTextLabel.text = ""
	
	get_tree().change_scene_to_file("res://Gameplay/Gameplay.tscn")


func skip() -> void:
	get_tree().change_scene_to_file("res://Gameplay/Gameplay.tscn")
