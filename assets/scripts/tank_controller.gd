class_name TankController extends Node2D

@export
var current_speed: float
@export
var default_speed: float

@onready
var movement_state_machine: Node = $"../movement_state_machine"
@onready
var gun_state_machine: Node = $"../gun_state_machine"
@onready
var tank_move_component = $"../tank_move_component"
@onready
var character_body2d: CharacterBody2D = $".."
@onready
var turret: Node2D = $Hull/Turret

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	movement_state_machine.init(character_body2d, tank_move_component)
	gun_state_machine.init(character_body2d, tank_move_component)
	
func _unhandled_input(event: InputEvent) -> void:
	movement_state_machine.process_input(event)
	gun_state_machine.process_input(event)
	
func _physics_process(delta: float) -> void:
	movement_state_machine.process_physics(delta)
	gun_state_machine.process_physics(delta)
	get_cannon_rotation()

func _process(delta: float) -> void:
	movement_state_machine.process_frame(delta)
	gun_state_machine.process_frame(delta)

func get_cannon_rotation() -> void:
	return turret.look_at(get_global_mouse_position())
