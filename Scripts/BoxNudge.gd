extends Area2D

@export var pushDir = Vector2(0, -1)
@export var pushForce = 5
@export var emergencyBox: PackedScene
@export var boxSpot: Vector2

func _physics_process(delta):
	for object: Node in get_overlapping_bodies():
		if object is RigidBody2D:
			object.apply_central_impulse(pushDir * pushForce)
			if emergencyBox != null and object.is_in_group("box"):
				var boxInstance = emergencyBox.instantiate()
				boxInstance.global_position = boxSpot
				get_tree().root.get_child(0).add_child.call_deferred(boxInstance)
				object.queue_free()
