extends Node2D

onready var pipe_scn = preload("res://Scenes/Pipe.tscn")
onready var pipes = []

signal point

func _ready():
	randomize()

func _spawn_pipe():
	
	var pos = Vector2(300,int(rand_range(150,280)))
	var gap = 60
	var current_pipe = pipe_scn.instance()
	current_pipe.visible = true
	current_pipe._place_pipe(pos, gap)
	current_pipe.connect("point",self,"forward_point_signal")
	pipes.append(current_pipe)
	$GeneratedPipe.add_child(current_pipe)


func _on_Timer_timeout():
	_spawn_pipe()

func forward_point_signal():
	Sound.play("point")
	$UI._set_score(Singleton._get_score())
	pass

func _on_Bird_flap():
	Sound.play("flap")
	pass # Replace with function body.


func _on_Bird_dead():
	Sound.play("die")
	Singleton._add_record()
	Singleton._reset_score()
	$UI._game_over()
	pass # Replace with function body.
