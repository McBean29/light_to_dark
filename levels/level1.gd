extends Node2D

func _ready():
	global.battery_health = 0
	$player/battery_pack_sprite/tbattery_pack.stop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StaticBody2D2_body_entered(body):
	get_tree().change_scene("res://levels/cave.tscn")
	pass # Replace with function body.


func _on_welcome_body_entered(body):
	$HUD/pp_intro.popup()
