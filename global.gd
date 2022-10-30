extends Node

var battery_health = 4
var current_level = 1
var max_health = 3
var current_health = 3


func _ready():
	pass

func damage_player(attack):
	current_health -= attack
	if global.current_health == 3:
		$gui/AnimatedSprite.frame = 0
	elif global.current_health == 2:
		$gui/AnimatedSprite.frame = 1
	elif global.current_health ==1:
		$gui/AnimatedSprite.frame = 2
