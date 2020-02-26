extends Node2D

func _set_score(txt):
	$Score.text = str(txt)
	
func _game_over():
	$GameOver.visible = true

func _on_GameOver_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/Menu.tscn")
