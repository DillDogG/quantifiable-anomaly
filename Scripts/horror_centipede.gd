extends Node2D
class_name CentiSegment

@export var previous: CentiSegment
@export var speed = 45
var player: Player
var applePosition = Vector2(232, 112)
var forward = Vector2(1, 0)
var speedMult = 1.0
var spawnedJams: Array[Area2D]

func _ready():
	player = get_tree().root.get_child(0).find_child("Player")

func _physics_process(delta):
	if forward.x != 0 and applePosition.x != round(round(position.x)):
		position.x += forward.x * (speed * speedMult * delta)
		if (round(position.x) < applePosition.x and forward.x == -1) or (round(position.x) > applePosition.x and forward.x == 1):
			position.x = applePosition.x
	elif forward.y != 0 and applePosition.y != round(position.y):
		position.y += forward.y * (speed * speedMult * delta)
		if (round(position.y) < applePosition.y and forward.y == -1) or (round(position.y) > applePosition.y and forward.y == 1):
			position.y = applePosition.y
	elif previous == null:
		while (spawnedJams.size() > 0):
			spawnedJams[0].queue_free()
			spawnedJams.remove_at(0)
		spawnedJams.push_back(player.dropJam())
		speedMult += 0.05
		applePosition = Vector2(round(player.position.x), round(player.position.y))
		updateForward()
	else:
		applePosition = previous.applePosition
		speedMult += 0.05
		updateForward()
	updateAppleForward()

func updateAppleForward():
	if applePosition.x == round(position.x):
		if applePosition.y > round(position.y):
			forward = Vector2(0, 1)
			rotation = deg_to_rad(90)
		elif applePosition.y < round(position.y):
			forward = Vector2(0, -1)
			rotation = deg_to_rad(-90)
	elif applePosition.y == round(position.y):
		if applePosition.x > round(position.x):
			forward = Vector2(1, 0)
			rotation = deg_to_rad(0)
		elif applePosition.x < round(position.x):
			forward = Vector2(-1, 0)
			rotation = deg_to_rad(180)

func updateForward():
	if applePosition.x == round(position.x) and applePosition.y == round(position.y):
		return
	if (forward.x == -1 and applePosition.x > round(position.x)) or (forward.x == 1 and applePosition.x < round(position.x)):
		if applePosition.y > round(position.y):
			forward = Vector2(0, 1)
			rotation = deg_to_rad(90)
		elif applePosition.y < round(position.y):
			forward = Vector2(0, -1)
			rotation = deg_to_rad(-90)
		else:
			forward.x *= -1
	elif (forward.y == -1 and applePosition.y > round(position.y)) or (forward.y == 1 and applePosition.y < round(position.y)):
		if applePosition.x > round(position.x):
			forward = Vector2(1, 0)
			rotation = deg_to_rad(0)
		elif applePosition.x < round(position.x):
			forward = Vector2(-1, 0)
			rotation = deg_to_rad(180)
		else:
			forward.y *= -1
