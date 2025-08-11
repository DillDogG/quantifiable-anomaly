extends RigidBody2D

@export var move_speed = -50
var timer: float = 0.0
var timerWalk: float = 0.0
@export var timerSet = 3
@export var timerSetWalk = 1
@export var dead = false
var animator

func _ready():
	animator = $AnimatedSprite2D
	animator.play("idle")
	
func _physics_process(delta):
	if dead == false:
		timer -= delta
		if timer <= 0:
			linear_velocity.x = move_speed
			animator.play("walk")
			timerWalk -= delta
			if timerWalk <= 0:
				timerWalk = timerSetWalk
				linear_velocity.x = 0
				animator.play("idle")
				move_speed *= -1
				animator.flip_h = move_speed < 0
				timer = timerSet
	else:
		animator.play("dead")
