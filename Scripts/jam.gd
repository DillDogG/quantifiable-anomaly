extends Area2D

var animator
@export var levelPath: String

func _ready():
	animator = $AnimatedSprite2D
	animator.play("default")


func _on_body_entered(body: Player) -> void:
	get_tree().change_scene_to_file(levelPath)
