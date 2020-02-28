extends Node

onready var score = 0
onready var best_score = 0

func _set_score(val):
	score = val
	
func _get_score():
	return score
	
func _add_score():
	score += 1
	
func _reset_score():
	score = 0
	
func _add_record():
	if best_score < score:
		best_score = score
