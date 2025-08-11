extends RigidBody2D

var animator
@export var evil = false

func _ready():
	animator = $AnimatedSprite2D
	animator.play("idle")
	if evil == true:
		animator.play("evil_idle")
