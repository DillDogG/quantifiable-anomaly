extends "res://Scripts/interactable.gd"

@export var animator: AnimatedSprite2D
@export var collision: CollisionShape2D
var open = false

func handleInteraction():
	animator.play("open")
	open = true
	
func deactivateObject():
	animator.play_backwards("open")
	open = false

func _on_animation_finished() -> void:
	if not deactivatable:
		queue_free()
	else:
		collision.disabled = open
