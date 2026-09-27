class_name ball_physics extends Node




var angle:float
	#set(value):
#		if value == 0:
#			print("asd")
#			angle = deg_to_rad(40)
@export var body: CharacterBody2D


@export var speed: int = 300
var originial_speed = 300
var angle_debounce: bool = true
var direction1: float
var direction2: float
var speed_up_once:bool = false
var ball_inside: bool = true


@onready var timer: Timer = $"../Timer"
@onready var collision: collision = $"../collision"



func _ready() -> void:
	angle = deg_to_rad(50*randf_range(-1,1))


	body.collision_layer = 2
	no_collision_long()
	collision.bouncey.connect(bounce)
	

func _physics_process(delta: float) -> void:

	direction1 = Input.get_axis("Up", "Down")
	direction2 = Input.get_axis("Down2","Up2")
	body.velocity.x = speed * cos(angle)  
	body.velocity.y = speed * sin(angle)

	if Global.end:
		body.position.x = 245
		body.position.y = 245
		Global.end = false
		speed = originial_speed
		angle = deg_to_rad(50*randi_range(-1,1))

	body.move_and_slide()


func bounce(identifier:String) -> void:
	if identifier == "Paddle":
		if speed_up_once:
			speed = originial_speed
			speed_up_once = false
		print(body.velocity.y)
		
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
