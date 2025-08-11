extends RigidBody2D

@export var move_speed = 100
var timer: float = 0.0
var timerWalk: float = 0.0
@export var timerSet = 1
@export var timerSetMove = 3
@export var evil = false
@export var horizontal = false
var glitchScene = preload("res://Prefabs/KillField.tscn")
var glitchInstance = glitchScene
var animator

func _ready():
	animator = $AnimatedSprite2D
	if evil == false:
		animator.play("idle")
	else:
		animator.play("evil_idle")
		var glitchInstance = glitchScene.instantiate()
		add_child(glitchInstance)
	

func _physics_process(delta):
	timer -= delta
	if timer <= 0:
		if horizontal == false:
			linear_velocity.y = move_speed
		else:
			linear_velocity.x = move_speed
		
		timerWalk -= delta
		if timerWalk <= 0:
			timerWalk = timerSetMove
			if horizontal == false:
				linear_velocity.y = 0
			else:
				linear_velocity.x = 0
			move_speed *= -1
			timer = timerSet
