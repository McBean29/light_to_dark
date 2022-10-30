extends KinematicBody2D

const UP_DIRECTION = Vector2.UP

var speed = 600
var jump_strength = 800
var maximum_jumps = 2
var double_jump_strength = 1200
var gravity = 4500
var light_pickup = 4
var max_battery = 5

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
	
	#movement status
	var is_falling = _velocity.y > 0.0 and not is_on_floor()
	var is_jumping = Input.is_action_just_pressed("jump") and is_on_floor()
	var is_double_jumping = Input.is_action_just_pressed("jump") and is_falling
	var is_jump_cancelled = Input.is_action_just_released("jump") and _velocity.y < 0.0
	var is_idling = is_on_floor() and is_zero_approx(_velocity.x)
	var is_running = is_on_floor() and not is_zero_approx(_velocity.x)
	if is_jumping:
		_jumps_made += 1
		_velocity.y = -jump_strength
	elif is_double_jumping:
		_jumps_made+=1
		if _jumps_made <= maximum_jumps:
			_velocity.y = -double_jump_strength
	elif is_jump_cancelled:
		_velocity.y=0.00
	elif is_jump_cancelled:
		_velocity.y = 0.0
	elif is_idling or is_running:
		_jumps_made = 0	
	
	_velocity = move_and_slide(_velocity, UP_DIRECTION)

func _on_tbattery_pack_timeout():
	if global.battery_health == 0:
		$t_light.enabled = false
	elif global.battery_health ==1:
		$t_light.enabled = false
		global.battery_health -=1
	else:
		$t_light.enabled = true
		$t_light.scale = Vector2(global.battery_health, global.battery_health)
		global.battery_health -=1
		$battery_pack_sprite.frame= 4 - global.battery_health

func _battery_charge():
	print("Charging")
	if global.battery_health == max_battery:
		$battery_pack_sprite/tbattery_pack.start()
	elif global.battery_health >= 0:
		global.battery_health += 1
		print(global.battery_health)
		$t_light.enabled= true
		$t_light.scale = Vector2(global.battery_health+1,global.battery_health+1)
		$battery_pack_sprite/tbattery_pack.start()

func _damage(x):
	global.current_health -= x
	if global.current_health <= 0:
		get_tree().change_scene("res://levels/game_over_lava.tscn")
