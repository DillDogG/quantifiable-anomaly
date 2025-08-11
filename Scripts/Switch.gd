extends Sprite2D

var detectionArea: Area2D
var interactedWith = false
var consoleUI: ConsoleUI
@export var resetTimer = -1
@export var connectedObjects: Array[Interactable]

func _ready() -> void:
	detectionArea = $Area2D
	consoleUI = get_tree().root.get_child(0).find_child("ConsoleUi").get_child(0).get_child(0).get_child(0)

func _physics_process(_delta):
	if not interactedWith:
		for object: Node in detectionArea.get_overlapping_bodies():
			if object.is_in_group("player") and Input.is_action_just_pressed("interact"):
				handleInteraction()

func handleInteraction():
	$ActivateSound.play()
	flip_h = true
	interactedWith = true
	consoleUI.OutputConsoleLog("Switch activated")
	activateAction()
	if resetTimer >= 0:
		await get_tree().create_timer(resetTimer).timeout
		resetSwitch()

func resetSwitch():
	$ResetSound.play()
	flip_h = false
	interactedWith = false
	consoleUI.OutputConsoleLog("Switch deactivated")
	deactivateAction()

func activateAction():
	for object: Interactable in connectedObjects:
		object.handleInteraction()

func deactivateAction():
	for object: Interactable in connectedObjects:
		object.deactivateObject()
