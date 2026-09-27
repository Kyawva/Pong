class_name ball_physics extends Node




var angle:float

@export var body: CharacterBody2D


@export var speed: int = 300
var originial_speed = 400
var angle_debounce: bool = true
var direction1: float
var direction2: float
var speed_up_once:bool = false
var ball_inside: bool = true


@onready var timer: Timer = $"../Timer"
@onready var collision: collision = $"../collision"



func _ready() -> void:
	angle_change()
	speed = originial_speed
	body.collision_layer = 2
	#no_collision_long()
	collision.bouncey.connect(bounce)
	

func _physics_process(delta: float) -> void:

	direction1 = Input.get_axis("Up", "Down")
	direction2 = Input.get_axis("Down2","Up2")
	body.velocity.x = speed * cos(angle)  
	body.velocity.y = speed * sin(angle)

	if Gamemanager.end:
		body.position.x = 584
		body.position.y = 326
		Gamemanager.end = false 
		speed = originial_speed
		angle_change()
		
		

	body.move_and_slide()


func bounce(identifier:String) -> void:
	if identifier == "Paddle":
		if speed_up_once:
			speed = originial_speed
			speed_up_once = false
		print(angle)
		
		if body.position.x < 600:
			if (direction1 < 0 and body.velocity.y < 0) or (direction1 > 0 and body.velocity.y > 0):
				
				speed += 100
			else:
				speed -= 30				
		else:
			if (direction2 < 0 and body.velocity.y < 0) or (direction2 > 0 and body.velocity.y > 0):
				
				speed += 100
			else:
				speed -= 30		
		angle = deg_to_rad(180) - angle 

	if identifier == "Border":
		angle = -angle  
func no_collision_long() -> void:
		timer.start()	

func _on_timer_timeout() -> void:
	timer.stop()
	speed += 500
	speed_up_once = true

func angle_change() -> void:
	angle = deg_to_rad(170*randi_range(-1,1))
	print(angle)
	if angle == 0:
		angle = deg_to_rad(160)
