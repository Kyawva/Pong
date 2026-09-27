class_name movement_player2 extends CharacterBody2D

@onready var movement_component: Movement_component = $Movement_component

@onready var movement_direction: movement_direction = $movement_direction



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	movement_component.update()
	
	#read movement
	movement_direction.direction = movement_component.move_dir2
	movement_direction.tick(delta)
