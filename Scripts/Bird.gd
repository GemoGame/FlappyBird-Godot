extends KinematicBody2D

const GRAVITY 	= 9.8 * Vector2.DOWN
const FLAP		= 3 * Vector2.UP
var velocity = Vector2()
var collosion
var is_dead = false


signal flap()
signal dead()

func _initiate_bird():
	position = Vector2(30,288/2)
	
func _ready():
	_initiate_bird()
	
func _process(delta):
	velocity += GRAVITY * delta
	collosion = move_and_collide(velocity)
	if Input.is_action_just_pressed("left_click") and !is_dead:
		_flap()
	if collosion != null && !is_dead:
		is_dead = true
		emit_signal("dead")
		get_tree().paused = true

func _flap():
	velocity = FLAP
	emit_signal("flap")
	
func _get_collosion():
	if collosion != null:
		return collosion
