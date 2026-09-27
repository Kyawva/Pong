class_name AI extends CharacterBody2D
@onready var movement_direction: movement_direction = $movement_direction
#@onready var ai_movement_component: AI_movement_component = $AI_movement_component

@export var ball:Node2D

var chance_to_move: float:
	get:
		return randi_range(0,100)


func _physics_process(delta: float) -> void:
	if ball == null:
		return
	
	if ball.position.y < position.y and chance_to_move >= 80:
		movement_direction.direction = -1
	if ball.position.y > position.y and chance_to_move >= 80:
		movement_direction.direction = 1
	

	movement_direction.tick(delta)
		 
