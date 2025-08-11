extends Area2D

var animator

func _ready():
	animator = $AnimatedSprite2D
	animator.play("default")


func _on_body_entered(body: Player) -> void:
	print("Level Complete")
