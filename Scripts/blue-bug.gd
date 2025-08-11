extends RigidBody2D

var animator
@export var evil = false
@export var speed = 50
var player: Player

func _ready():
	animator = $AnimatedSprite2D
	animator.play("idle")
	if evil == true:
		animator.play("evil_idle")
		
	player = get_tree().root.get_child(0).find_child("Player")

func _physics_process(delta):
	if not evil and not Input.is_action_pressed("hide"): return
	if evil and player.global_position.y < global_position.y + 5 and player.global_position.y > global_position.y - 5 and player.global_position.x < global_position.x + 100 and player.global_position.x > global_position.x - 100:
		$ActivateSound.play()
		if player.global_position.x < global_position.x + 100 and not player.global_position.x < global_position.x:
			apply_central_impulse(Vector2(speed, 5))
		else:
			apply_central_impulse(Vector2(-speed, 5))
