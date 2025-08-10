extends CharacterBody2D
class_name Player

@export var move_speed = 300
@export var jump_force = 100
@export var push_force = 15
@onready var jam = preload("res://Prefabs/Evil_Jam.tscn")
var gravity
var animator: AnimatedSprite2D

func _ready() -> void:
	animator = $AnimatedSprite2D


func read_input():
	var input_direction = Input.get_axis("left", "right")
	velocity.x = input_direction * (move_speed * (0.5 if Input.is_action_pressed("hide") else 1.0))
	
func _physics_process(delta):
	gravity = get_gravity()
	velocity.y += (gravity.y * delta) / 3
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = -jump_force
	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y /= 2
	if velocity.y > gravity.y * 0.01667 * 20:
		velocity.y = gravity.y * 0.01667 * 20
	read_input()
	if abs(velocity.x) > 0:
		animator.play("run")
		animator.flip_h = velocity.x < 0
	else:
		animator.play("idle")
	move_and_slide()
	check_box_collisions()
	
func check_box_collisions():
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider() is RigidBody2D:
			collision.get_collider().apply_central_impulse(-collision.get_normal() * push_force)
		if collision.get_collider().is_in_group("centipede"):
			print("test")


func dropJam():
	var jamInstance = jam.instantiate()
	jamInstance.global_position = position
	get_tree().root.get_child(0).add_child.call_deferred(jamInstance)
	return jamInstance
