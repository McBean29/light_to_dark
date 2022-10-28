extends Node2D


func _ready():
	pass


func _on_a2d_battery_body_entered(body):
	if global.battery_health == 4:
		pass
	elif global.battery_health <4:
		global.battery_health += 1

