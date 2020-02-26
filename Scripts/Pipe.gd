extends Node2D

func _place_pipe(pos, gap):
	position = pos
	$UpperPipe.position.y -= (gap/2)
	$LowerPipe.position.y += (gap/2)

func _process(delta):
	$UpperPipe.move_and_collide(Vector2(-100,0) * delta)
	$LowerPipe.move_and_collide(Vector2(-100,0) * delta)
	if position.x < -30:
		queue_free()
