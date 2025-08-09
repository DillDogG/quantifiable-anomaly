extends CharacterBody2D
signal hit

@export var move_speed = 300
@export var jump_force = 100

func read_input():
	var input_direction = Input.get_axis("left", "right")
	velocity.x =input_direction * move_speed
	
func _physics_process(delta):
	velocity.y += (get_gravity().y * delta) / 3
	if Input.is_action_pressed("jump"):
		velocity.y = -jump_force
	if velocity.y > get_gravity().y * 0.01667 * 10:
		velocity.y = get_gravity().y * 0.01667 * 10
	read_input()
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	hide() # Player disappears after being hit.
	hit.emit()
	# Must be deferred as we can't change physics properties on a physics callback.
	$CollisionShape2D.set_deferred("disabled", true)
