extends Node2D

@export var head: AnimatedSprite2D
@export var body: Array[AnimatedSprite2D]
@export var tail: AnimatedSprite2D
var player: CharacterBody2D
# screen size is 20 by 11, 0 is off screen
var applePosition = Vector2(14, 7)
var forward = Vector2(1, 0)
var chaseApple = true

func _ready():
	player = get_tree().root.get_child(0).find_child("Player")
	head.play("default")
	tail.play("default")
	for part: AnimatedSprite2D in body:
		part.play("default")

func _physics_process(_delta):
	if chaseApple:
		if forward.x != 0 and (applePosition.x * 16) != (position.x + 8):
			position.x += forward.x
		elif forward.y != 0 and (applePosition.y * 16) != (position.y + 8):
			position.y += forward.y
		else:
			applePosition = Vector2(round(player.position.x / 16) + 1, round(player.position.y / 16) + 1)
			updateForward()
		updateAppleForward()
	
	
func updateAppleForward():
	if (applePosition.x * 16) == (position.x + 8):
		if (applePosition.y * 16) > (position.y + 8):
			forward = Vector2(0, 1)
		elif (applePosition.y * 16) < (position.y + 8):
			forward = Vector2(0, -1)
	elif (applePosition.y * 16) == (position.y + 8):
		if (applePosition.x * 16) > (position.x + 8):
			forward = Vector2(1, 0)
		elif (applePosition.x * 16) < (position.x + 8):
			forward = Vector2(-1, 0)

func updateForward():
	if (applePosition.x * 16) == (position.x + 8) and (applePosition.y * 16) == (position.y + 8):
		return
	if (forward.x == -1 and (applePosition.x * 16) > (position.x + 8)) or (forward.x == 1 and (applePosition.x * 16) < (position.x + 8)):
		if (applePosition.y * 16) > (position.y + 8):
			forward = Vector2(0, 1)
		elif (applePosition.y * 16) < (position.y + 8):
			forward = Vector2(0, -1)
		else:
			forward.x *= -1
	elif (forward.y == -1 and (applePosition.y * 16) > (position.y + 8)) or (forward.y == 1 and (applePosition.y * 16) < (position.y + 8)):
		if (applePosition.x * 16) > (position.x + 8):
			forward = Vector2(1, 0)
		elif (applePosition.x * 16) < (position.x + 8):
			forward = Vector2(-1, 0)
		else:
			forward.y *= -1
