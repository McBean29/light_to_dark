extends Node2D


func _ready():
	global.battery_health = 5
	global.current_level = 2
	$player/battery_pack_sprite/tbattery_pack.start()
	$player/t_light.enabled = true
	$player/t_light.scale = Vector2(global.battery_health,global.battery_health)


func _on_lava_body_entered(body):
	get_tree().change_scene("res://levels/game_over_lava.tscn")
