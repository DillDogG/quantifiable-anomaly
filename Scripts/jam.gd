extends Area2D

var animator
@export var levelPath: String

func _ready():
	animator = $AnimatedSprite2D
	animator.play("default")


func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene_to_file(levelPath)
	elif body.is_in_group("cute"):
		body.queue_free()
		await get_tree().create_timer(2).timeout
		queue_free()
