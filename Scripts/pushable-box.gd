extends RigidBody2D


func _physics_process(delta):
	if Input.is_action_pressed("hide"):
		apply_central_impulse(Vector2(0, -20))
