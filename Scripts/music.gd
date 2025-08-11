extends Node

func _ready():
	$Music.play()
	await get_tree().create_timer(3).timeout
	$Music.stop()
	$Intro.play()
	await get_tree().create_timer(7.73).timeout
	$Intro.stop()
	$Centipede.play()
