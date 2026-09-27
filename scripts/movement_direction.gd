class_name movement_direction extends Node



@export var velocity:int = 50
@export var body : CharacterBody2D
@export var model : Node2D
var p 
var direction : int 

	
func tick(_delta) -> void:
	if body == null:
		return 
	body.position.y = clamp(body.position.y,90,553)
	body.velocity.y = direction * velocity
	
	body.move_and_slide()


	
	
	
	
	
	
	
