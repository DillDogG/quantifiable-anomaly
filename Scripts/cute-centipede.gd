extends RigidBody2D

@export var move_speed = 100
var animator

func _ready():
	animator = $AnimatedSprite2D
	linear_velocity.x = move_speed
	animator.play("move")
