extends RigidBody2D

@export var move_speed = 100
var timer: float = 0.0
var timerMove: float = 0.0
@export var timerSet = 1
@export var timerSetMove = 5

func _physics_process(delta):
	timer -= delta
	if timer <= 0:
		linear_velocity.x = move_speed
		timerMove -= delta
		if timerMove <= 0:
			timerMove = timerSetMove
			linear_velocity.x = 0
			move_speed *= -1
			timer = timerSet
