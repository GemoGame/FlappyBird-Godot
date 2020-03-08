extends KinematicBody2D

const GRAVITY 	= 9.8 * Vector2.DOWN # Kecepatan Gravitasi
const FLAP		= 3 * Vector2.UP # Kecepatan Bird saat dalam keadaan "flap"
var velocity = Vector2()
var collosion
var is_dead = false


signal flap()
signal dead()

func _initiate_bird():
	position = Vector2(30,288/2)
	
func _ready():
	_initiate_bird() # menginisiasi posisi awal agar Bird berada dalam kondisi yang tepat
	
func _process(delta):
	velocity += GRAVITY * delta
	collosion = move_and_collide(velocity)
	if Input.is_action_just_pressed("left_click") and !is_dead:
		_flap() # memanggil fungsi flap sehingga Bird akan bergerak dalam keadaan "flap"
		#Bird akan mati apa bila mengenai objek yang dapat collide (disini ada ground dan pipe)
	if collosion != null && !is_dead:
		is_dead = true
		emit_signal("dead") # mentransmit signal ke node yang sudah diatur tujuannya
		get_tree().paused = true

func _flap():
	if position.y >= 20:
		velocity = FLAP
		emit_signal("flap") # mentransmit signal ke node yang sudah diatur tujuannya
	
func _get_collosion(): #mengembalikan data objek yang collide dengan Bird
	if collosion != null:
		return collosion
