extends KinematicBody2D
export var movement_speed = 40
export var direction_right = 1
var gravity = 20
var velocity = Vector2()

func _floor_checker_pos():
	$floor_checker.position.x == $CollisionShape2D.shape.get_extents().x * direction_right

func _ready():
	if direction_right == 1:
		$AnimatedSprite.flip_h = true
	_floor_checker_pos()
	pass

func _physics_process(delta):
	
	if is_on_wall() or not $floor_checker.is_colliding() and is_on_floor():
		direction_right = direction_right * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		_floor_checker_pos()
	velocity.y += 50
	
	velocity.x = movement_speed * direction_right
	
	velocity = move_and_slide(velocity, Vector2.UP)



func _on_top_checker_body_entered(body):
	get_node(".").queue_free()
	pass # Replace with function body.


func _on_body_checker_body_entered(body):
	body._damage(1)
	pass # Replace with function body.
