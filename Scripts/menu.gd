extends Node

func _ready():
	$Intro.play()
	await get_tree().create_timer(7.73).timeout
	$Theme.play()


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level1.tscn")
