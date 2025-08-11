extends Area2D

var isActivated = false
@export var isMessage = false
@export var isError = false
@export var isDev = false
@export var dialogue: String
var consoleUI: ConsoleUI

func _ready():
	consoleUI = get_tree().root.get_child(0).find_child("ConsoleUi").get_child(0).get_child(0).get_child(0)

func _physics_process(_delta):
	if not isActivated:
		for object: Node in get_overlapping_bodies():
			if object.is_in_group("player"):
				isActivated = true
				if isMessage: consoleUI.OutputMessageLog(dialogue)
				elif isError: consoleUI.OutputConsoleError(dialogue)
				else: consoleUI.OutputDevLog(dialogue)
