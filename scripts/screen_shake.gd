extends Node2D






func _ready() -> void:
	$"../Ball/ball_physics/".screen_shake.connect(_on_screen_shake)
	
func _on_screen_shake(speed:int)->void:
	$Camera2D.screen_shake(8,5,speed)
	print("HI")
