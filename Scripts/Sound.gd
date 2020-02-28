extends Node

func play_audio(audio_name):
	if audio_name == "die":
		$DieAudio.play()
	elif audio_name == "flap":
		$FlapAudio.play()
	elif audio_name == "point":
		$PointAudio.play()
