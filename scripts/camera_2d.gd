extends Camera2D

var shake_intensity: float = 0.0
var active_shake_time: float = 0.0

var shake_decary:float = 5.0
var speed:int = 0.0
var shake_time:float = 0.0
var shake_time_speed:float = 20.0

var noise = FastNoiseLite.new()


func screen_shake(intensity:int, time:int, speed_ball:int ) -> void:
	randomize()				#creates new seed
	noise.seed = randi()  #i believe randi draws from the seed so makes it random every time
	noise.frequency = 2.0
	
	shake_intensity = intensity # better practice to set variables
	active_shake_time = time #in case you need to call them from another script
	speed = int(speed_ball / 50)						#however in my case i don't need to
	shake_time = 0.0
	
	
func _physics_process(delta: float) -> void:
	if active_shake_time >0:
		shake_time = delta * active_shake_time
		active_shake_time -= delta
	
		offset = Vector2(
			noise.get_noise_2d(shake_time,0) * shake_intensity * speed,
			noise.get_noise_2d(0,shake_intensity) * shake_intensity * speed	
		)		
		shake_intensity = max(shake_intensity-shake_decary,0) 
		# will slowly go down until 0
	else:
		offset = lerp(offset, Vector2.ZERO, 10.5*delta)
	
