class_name movement_player extends CharacterBody2D

@onready var movement_component: Movement_component = $Movement_component
@onready var movement_direction: movement_direction = $movement_direction
@onready var label_player_1: Label = $Label

@onready var collision: collision = $collision







# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	movement_component.update()
	
	#read movement
	movement_direction.direction = movement_component.move_dir
#	ball_physics.direction = movement_component.move_dir
	movement_direction.tick(delta)
	


	
		
	
