extends Node

func get_horizontal_input() -> float:
	return Input.get_axis("left", "right")

func get_vertical_input() -> float:
	return Input.get_axis("up", "down")
	
