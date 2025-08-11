extends Node

func _ready():
	$Intro.play()
	await get_tree().create_timer(7.73).timeout
	$Theme.play()
