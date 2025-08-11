extends RigidBody2D

@export var move_speed = 100
var timer: float = 0.0
var timerMove: float = 0.0
var timerChange = 0
@export var timerSet = 1
@export var timerSetMove = 5
@export var corrupt = false
@export var timerChangeSet = 2

func _physics_process(delta):
	if corrupt == false:
		timer -= delta
		if timer <= 0:
			linear_velocity.x = move_speed
			timerMove -= delta
			if timerMove <= 0:
				timerMove = timerSetMove
				linear_velocity.x = 0
				move_speed *= -1
				timer = timerSet
	else:
		if timerChange <= 0:
			move_speed = randf_range(-200, 200)
			timerSetMove = randf_range(2, 6)
			timerSet = randf_range(0.5, 2)
			timerChange = timerChangeSet
		timer -= delta
		if timer <= 0:
			linear_velocity.x = move_speed
			timerMove -= delta
			timerChange -= delta
			if timerMove <= 0:
				timerMove = timerSetMove
				linear_velocity.x = 0
				move_speed *= -1
				timer = timerSet
