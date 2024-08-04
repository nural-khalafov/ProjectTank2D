extends State

@export
var idle_state: State

@onready 
var tank_controller: Node = $"../../Tank"

@export 
var vertical_movement: float
@export 
var horizontal_movement: float

var current_speed: float

# Called when the node enters the scene tree for the first time.
func enter() -> void:
	super()
	current_speed = tank_controller.default_speed

func process_input(event: InputEvent) -> State:
	return null

func process_physics(delta: float) -> State:
	vertical_movement = -get_vertical_movement_input()
	horizontal_movement = get_horizontal_movement_input()
	
	parent.velocity = parent.transform.x * vertical_movement * current_speed * delta
	parent.rotation += horizontal_movement * delta
	parent.move_and_slide()
	
	if parent.velocity == Vector2.ZERO:
		return idle_state
	
	return null
