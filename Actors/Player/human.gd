class_name Human extends CharacterBody2D

@export_group("Nodes")
@export var inputComponent : InputComponent
@export var velocityComponent : VelocityComponent

@onready var animationTree = %AnimationTree

var addVelocityModifiers : Array[float] = []
var multVelocityModifiers : Array[float] = []

func _physics_process(delta):
	resetModifiers()
	
	inputComponent.handleMoveInputs(delta)
	
	handleSprint()

	velocityComponent.addSpeedModifiers(addVelocityModifiers, multVelocityModifiers)
	velocityComponent.updateVelocity()
	velocityComponent.applyVelocity()
	handleAnimation()

func handleSprint():
	if inputComponent.sprintInput == true:
		multVelocityModifiers.push_back(1.5)


func handleAnimation():
	
	animationTree["parameters/Idle/blend_position"] = velocityComponent.getVelocityNormailized()
	animationTree["parameters/Walk/blend_position"] = velocityComponent.getVelocityNormailized()
	animationTree["parameters/Run/blend_position"] = velocityComponent.getVelocityNormailized()
	
func resetModifiers():
	addVelocityModifiers = []
	multVelocityModifiers = []
