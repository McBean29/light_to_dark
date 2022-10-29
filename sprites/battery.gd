extends Node2D


func _ready():
	pass


func _on_a2d_battery_body_entered(body):
	$a2d_battery.queue_free()
	body._battery_charge()

