extends Node2D


func _process(_delta):
	if Input.is_action_just_pressed("left_click"):
		get_tree().change_scene("res://Scenes/Main.tscn")
