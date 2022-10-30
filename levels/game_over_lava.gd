extends Control


func _ready():
	pass


func _on_Button_pressed():
	if global.current_level == 1:
		get_tree().change_scene("res://levels/level1.tscn")
	elif global.current_level == 2:
		get_tree().change_scene("res://levels/cave.tscn")
	elif global.current_level == 3:
		get_tree().change_scene("res://levels/cave2.tscn")
	pass # Replace with function body.
