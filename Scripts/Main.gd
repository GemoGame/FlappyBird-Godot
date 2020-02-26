extends Node2D

onready var pipe_scn = preload("res://Scenes/Pipe.tscn")
onready var pipes = []
onready var score = 0


func _ready():
	randomize()

func _spawn_pipe():
	
	var pos = Vector2(300,int(rand_range(150,280)))
	var gap = 60
	var current_pipe = pipe_scn.instance()
	current_pipe.visible = true
	current_pipe._place_pipe(pos, gap)
	pipes.append(current_pipe)
	add_child(current_pipe)


func _on_Timer_timeout():
	_spawn_pipe()


func _on_Area2D_body_exited(_body):
	$PointAudio.play()
	$Bird/Area2D.visible = false
	score += 1
	print(score)
	$UI._set_score(score)
	$ScorePointTimer.start()
	pass # Replace with function body.


func _on_Bird_flap():
	$FlapAudio.play()
	pass # Replace with function body.


func _on_Bird_dead():
	$DieAudio.play()
	$UI._game_over()
	pass # Replace with function body.


func _on_ScorePointTimer_timeout():
	$Bird/Area2D.visible = true
	pass # Replace with function body.
