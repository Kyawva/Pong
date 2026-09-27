extends Node
@onready var label: Label = $"../Control/Label"
@onready var label_2: Label = $"../Control/Label2"






func _ready() -> void:
	# without ../ it will go into the paddle parent node
	#need it to check sibling node which is ball
	$"../Ball/collision".scored.connect(_on_scored)
	
func _on_scored(player:int) ->void:
	if player ==1:
		Global.score1 += 1
		label.text = str(Global.score1)
	else:
		Global.score2 += 1
		label_2.text = str(Global.score2)
	
	Global.end = true
	
	
		
	
	
