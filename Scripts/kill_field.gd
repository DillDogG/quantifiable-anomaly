extends Area2D

var timer = 1
var animator

func _ready():
	animator = $AnimatedSprite2D
	animator.play("default")

func _physics_process(delta):
	for object: Node in get_overlapping_bodies():
		timer -= delta
		if object.is_in_group("player"):
			get_tree().reload_current_scene()
		if timer <= 0:
			queue_free()
