extends KinematicBody2D

const GRAVITY 	= 9.8 * Vector2.DOWN # Kecepatan Gravitasi
const FLAP		= 3 * Vector2.UP # Kecepatan Bird saat dalam keadaan "flap"
var FORWARD = Vector2()
var velocity = Vector2()
var collosion
var is_dead = false

signal dead()

func _initiate_bird(pos):
	position = pos
	
func _ready():
	$AnimatedSprite.flip_h = true
	randomize()
	FORWARD = (randi()%150+1 + 150) * Vector2.LEFT
	
func _process(delta):
	_move(FORWARD,delta)
	if collosion != null:
		emit_signal("dead")

func _move(velocity,delta):
	collosion = move_and_collide(FORWARD * delta, false)
	if position.x <= -20:
		queue_free()

func _random_flap():
	var flap_chance = randi()%101+1
	if flap_chance >= 85:
		_flap()
	elif position.y >= 360:
		_flap()

func _flap():
	if position.y >= 20:
		velocity = FLAP
		emit_signal("flap") # mentransmit signal ke node yang sudah diatur tujuannya

func _add_speed(speed):
	FORWARD += speed
