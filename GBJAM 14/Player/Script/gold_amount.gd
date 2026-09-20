@tool
extends Control

@export var amount = 0:
	set(value):
		if value < 100000:
			var str_value = str(value)
			
			var label_value = ""
			
			for i in range(5 - str_value.length()):
				label_value += "0"
			label_value += str_value
			
			$"H Container/Amount".text = label_value
			
			print(value)
			
			amount = value
		else:
			$"H Container/Amount".text = "MAX"
			
			
			amount = 100000
		
		
		
		
