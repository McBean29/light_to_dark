extends KinematicBody2D

const UP_DIRECTION = Vector2.UP

var speed = 600
var jump_strength = 1500
var maximum_jumps = 2
var double_jump_strength = 1200
var gravity = 4500
var light_pickup = 4

var _jumps_made = 0
var _velocity = Vector2.ZERO

func _ready():
	
	pass
func _physics_process(delta: float) -> void:
	
	var _horizontal_direction = (
		Input.get_action_strength("move_right")
		- Input.get_action_strength("move_left")
	)
	
	_velocity.x = _horizontal_direction * speed
	if _velocity.x <0:
		$character_sprite.play("run")
		$character_sprite.flip_h=true
	elif _velocity.x >0:
		$character_sprite.play("run")
		$character_sprite.flip_h=false
	elif _velocity.x == 0:
		$character_sprite.play("idle")
	_velocity.y += gravity * delta
	
	_velocity = move_and_slide(_velocity, UP_DIRECTION)

func _on_tbattery_pack_timeout():
	if global.battery_health == 0:
		pass
	else:
		global.battery_health -=1
		$battery_pack_sprite.frame= 4 - global.battery_health
	pass # Replace with function body.
