extends Node2D

var timer: float = 0.0
var segmentSpawn = position
var segmentScene = preload("res://Prefabs/CuteCentipedeBody.tscn")
var segmentInstance = segmentScene
@export var timerSet = 0.25
@export var maxSegments = 6
@export var doomed = false

func _physics_process(delta):
	timer -= delta
	if timer <= 0 && maxSegments >= 0:
		var segmentInstance = segmentScene.instantiate()
		if doomed == false:
			add_child(segmentInstance)
		if doomed == true:
			add_child(segmentInstance)
			segmentInstance.doomed = true
		segmentInstance.moveTimer -= 0.28
		timer = timerSet
		maxSegments -= 1
