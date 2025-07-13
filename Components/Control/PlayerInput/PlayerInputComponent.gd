class_name PlayerInputComponent extends InputComponent

var sprintInput: bool

func handleMoveInputs(delta):
	moveInput = Input.get_vector("left", "right", "up", "down")
	sprintInput = Input.is_action_pressed("sprint")
