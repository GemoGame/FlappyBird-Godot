extends KinematicBody2D

func _process(delta):
	move_and_collide(Vector2(-160,0) * delta)
	_check_position()

func _check_position():
	if position.x <= -320:
		position.x = 228
