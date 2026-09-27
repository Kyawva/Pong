class_name collision extends Area2D
@onready var ball_physics: ball_physics = $"../ball_physics"


signal bouncey(String)

signal scored(Player:int)



		
func _on_area_entered(area: Area2D) -> void:
	# send signal to ball_physics and will change the angle
	# depending on the string sent
	if area.is_in_group("Paddle"):
		bouncey.emit("Paddle")
	if area.is_in_group("Border"):
		bouncey.emit("Border")
	if area.is_in_group("Border_left_right"):
		print(ball_physics.body.position.x)
		if ball_physics.body.position.x > 250: 
			#first paddle is neg pos and second is pos 
			scored.emit(1)
		else:
			scored.emit(2)
			
