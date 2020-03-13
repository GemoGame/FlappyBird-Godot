extends Node2D

var SPEED : Vector2 = Vector2(0,5)
const SPEED_BOOST : Vector2 = 200 * Vector2.LEFT

signal point


func _ready():
	_place_pipe(Vector2(50,30),45)
	pass


func _place_pipe(pos, gap):
	position = pos
	$UpperPipe.position.y -= (gap/2)
	$LowerPipe.position.y += (gap/2)

func _process(delta):
	_move_pipe()
#	$UpperPipe.move_and_collide(Vector2(-100,0) * delta)
#	$LowerPipe.move_and_collide(Vector2(-100,0) * delta)
#	$WayPoint.position.x += -100 * delta
#	if position.x < -30:
#		queue_free()
	pass

func _move_pipe():
	if position.y > 10:
		if Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_down"):
			position -= SPEED
	if position.y < 506:
		if Input.is_action_pressed("ui_down") and not Input.is_action_pressed("ui_up"):
			position += SPEED


func _on_WayPoint_body_entered(body):
		Singleton._add_score()
		emit_signal("point")
		if body is KinematicBody2D:
			body._add_speed(SPEED_BOOST)
