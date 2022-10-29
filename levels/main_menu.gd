extends Control


func _ready():
	pass


func _on_btn_start_pressed():
	get_tree().change_scene("res://levels/level1.tscn")
