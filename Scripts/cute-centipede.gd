extends RigidBody2D

@export var move_speed = 100
@export var moveTimer = 2
var animator

func _ready():
	animator = $AnimatedSprite2D
	linear_velocity.x = move_speed
	animator.play("move")
	
func _physics_process(delta: float) -> void:
	moveTimer -= delta
	if moveTimer <= 0:
		linear_velocity.x = 0
	
