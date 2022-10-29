extends Control


func _ready():
	pass


func _on_btn_start_pressed():
	get_tree().change_scene("res://levels/controls.tscn")


func _on_btn_quit_pressed():
	get_tree().quit()
