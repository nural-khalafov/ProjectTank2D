class_name State extends Node

var move_component

var parent: CharacterBody2D

func enter() -> void:
	pass

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	return null

func get_horizontal_movement_input() -> float:
	return move_component.get_horizontal_input()

func get_vertical_movement_input() -> float:
	return move_component.get_vertical_input()
