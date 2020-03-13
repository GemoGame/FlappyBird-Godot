extends Node2D

onready var bird_scn = preload("res://Scenes/Bird.tscn")

signal point

func _ready():
	randomize()
	$Pipe._place_pipe(Vector2(50,30),30)
	$Pipe.connect("point",self,"forward_point_signal")

func _spawn_bird():
	var rand_y = randi()%240+1 + 144
	var bird = bird_scn.instance()
	bird._initiate_bird(Vector2(300,rand_y))
	bird.connect("dead",self,"Bird_dead")
	$GeneratedBird.add_child(bird)

func _on_Timer_timeout():
	_spawn_bird()
	pass

func forward_point_signal():
	Sound.play("point")
	$UI._set_score(Singleton._get_score())
	pass


func Bird_dead():
	Sound.play("die")
	Singleton._add_record()
	Singleton._reset_score()
	$UI._game_over()
	get_tree().paused = true
	pass # Replace with function body.
