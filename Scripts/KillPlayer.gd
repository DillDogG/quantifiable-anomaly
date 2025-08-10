extends Area2D

func _physics_process(_delta):
	for object: Node in get_overlapping_bodies():
		if object.is_in_group("player"):
			get_tree().reload_current_scene()
