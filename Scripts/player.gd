extends CharacterBody2D
signal hit

@export var move_speed = 300
@export var jump_force = 100
var animator

func _ready() -> void:
	animator = $AnimatedSprite2D

func read_input():
	var input_direction = Input.get_axis("left", "right")
	velocity.x = input_direction * move_speed
	
func _physics_process(delta):
	velocity.y += (get_gravity().y * delta) / 3
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = -jump_force
	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y /= 2
	if velocity.y > get_gravity().y * 0.01667 * 10:
		velocity.y = get_gravity().y * 0.01667 * 10
	read_input()
	if abs(velocity.x) > 0:
		animator.play("run")
		animator.flip_h = velocity.x < 0
	else:
		animator.play("idle")
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	hide() # Player disappears after being hit.
	hit.emit()
	# Must be deferred as we can't change physics properties on a physics callback.
	$CollisionShape2D.set_deferred("disabled", true)
