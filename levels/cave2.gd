extends Node2D


func _ready():
	global.current_level = 3
	$KinematicBody2D._battery_charge()
	pass


func _on_exit_door_body_entered(body):
	get_tree().change_scene("res://levels/vault.tscn")
