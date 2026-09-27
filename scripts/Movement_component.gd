class_name Movement_component extends Node

var move_dir: float = 0
var move_dir2: float = 0


func update() -> void:
	move_dir = Input.get_axis("Down", "Up")
	move_dir2 = Input.get_axis("Up2","Down2")
	
	
	# read movement
	
