extends AnimatableBody2D

@export var speed: float = 100.0  
@export var distance: float = 200.0

var start_x: float
var direction: int = 1

func _ready():
	start_x = global_position.x

func _physics_process(delta):
	global_position.x += speed * direction * delta
	
	if global_position.x > start_x + distance:
		direction = -1
		
	elif global_position.x < start_x:
		direction = 1  # Ubah arah ke kanan
