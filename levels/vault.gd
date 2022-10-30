extends Node2D


func _ready():
	global.battery_health = 0
	pass


func _on_Button_pressed():
	get_tree().change_scene("res://levels/level1.tscn")


func _on_exit_pressed():
	get_tree().quit()
