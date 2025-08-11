extends Area2D

@export var isHidable = false

func _physics_process(_delta):
	for object: Node in get_overlapping_bodies():
		if object.is_in_group("player"):
			if isHidable and Input.is_action_pressed("hide"): return
			get_tree().reload_current_scene()
