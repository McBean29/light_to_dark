extends KinematicBody2D
var velocity = Vector2()
var walkspeed = 12
var gravity = 1

func _ready():
	
	
	pass
func _physics_process(delta):
	get_input()
	
func get_input():
	velocity.y=1
	if Input.is_action_pressed("ui_left"):
		velocity.x = -walkspeed
	elif Input.is_action_pressed("ui_right"):
		velocity.x = walkspeed
	else:
		velocity.x = 0
	
	move_and_collide(velocity)
