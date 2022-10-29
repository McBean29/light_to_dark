extends Control


func _ready():
	
	pass
func _physics_process(delta):
	if Input.is_mouse_button_pressed(1):
		get_tree().change_scene("res://levels/level1.tscn")
