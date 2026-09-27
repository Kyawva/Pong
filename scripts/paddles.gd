extends Node

@onready var label: Label = $"../Score/Label"
@onready var label_2: Label = $"../Score/Label2"






func _ready() -> void:
	# without ../ it will go into the paddle parent node
	#need it to check sibling node which is ball
	Gamemanager.Change_score.connect(_on_scored)
	
func _on_scored(player:int, score:int) ->void:
	if player ==1:
		label.text = str(score)
	else:
		label_2.text = str(score)
	
	Gamemanager.end = true
	
	
		
	
	
