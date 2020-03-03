extends Node

var audio_list = {
	"die"	: preload("res://Assets/Sounds/die.ogg"),
	"point"	: preload("res://Assets/Sounds/point.ogg"),
	"flap"	: preload("res://Assets/Sounds/swoosh.ogg")
}

func play(audio):
	var temp_res = audio_list.get(audio)
	if temp_res == null:
		return
		
	for audio_channel in get_children():
		if audio_channel.stream == temp_res:
			audio_channel.play()
			return
		
		if !audio_channel.playing:
			audio_channel.stream = temp_res
			audio_channel.play()
			return
