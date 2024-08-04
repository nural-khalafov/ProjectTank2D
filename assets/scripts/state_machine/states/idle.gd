extends State

@export
var driving_state: State



func enter() -> void:
	super()
	parent.velocity = Vector2.ZERO
	
func process_input(event: InputEvent) -> State:
	if get_horizontal_movement_input() or get_vertical_movement_input() != 0.0:
		return driving_state
	return null
	
func process_physics(delta: float) -> State:
	return null
