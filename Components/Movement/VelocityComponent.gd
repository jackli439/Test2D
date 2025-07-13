class_name VelocityComponent extends Node2D 

@export_group("Nodes")
@export var actor : CharacterBody2D
@export var resource : Resource
@export var inputComponent : InputComponent

var currentSpeed

func _ready() -> void:
	currentSpeed = resource.speed

func updateVelocity():
	actor.velocity = inputComponent.getMoveVector() * currentSpeed

func applyVelocity():
	actor.move_and_slide()

func addSpeedModifiers(addModifiers : Array[float], multModifiers : Array[float]):
	currentSpeed = resource.speed
	
	for modifier in addModifiers:
		currentSpeed += modifier
	
	for modifier in multModifiers:
		currentSpeed *= modifier

func getCurrentSpeed():
	return currentSpeed
	
func getVelocity():
	return actor.velocity

func getVelocityNormailized():
	return actor.velocity.normalized()

func isMoving():
	return actor.velocity.length() != 0
