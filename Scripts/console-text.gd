extends RichTextLabel
class_name ConsoleUI
@export var level1 = true
@export var level2 = false
@export var level3 = false
@export var level4 = false

func _ready():
	if level1 == true:
		OutputMessageLog("Hello, valued quality tester! In preparation for our upcoming release, we need you to play through this level and check for any glitches. Find the ‘JAR OF JAM’ to complete the level!")
		await get_tree().create_timer(4).timeout
		OutputMessageLog("Use the ‘A’ and ‘D’ keys to move left and right, and the Space Bar to jump! Press ‘R’ to restart the level if you get stuck. This friendly centipede will help you cross the gap!")
		return
	if level2 == true:
		OutputDevLog("Developer here, I see you just finished the level. Looks like something is jammed up in the code, and some files got corrupted. We’re gonna have you run through the level again to make sure everything is still working.")
		await get_tree().create_timer(3).timeout
		OutputConsoleError("‘Push Force’ value set to <9999999>")
		return
	if level3 == true:
		OutputDevLog("Looks like something is seriously broken. We’re working on getting this fixed, run through it again and see if it gets any worse.")
		return
	if level4 == true:
		OutputDevLog("DEVELOPER MESSAGE: We just pushed out an update, something to clear up all this jam that’s gumming up the works. Give it one more shot and everything should be fixed.")
		await get_tree().create_timer(3).timeout
		OutputConsoleError("ERROR: the jam corRupts evEn this peacEful creaturE. run")
		return

func OutputConsoleLog(outLog):
	newline()
	push_color(Color.WEB_GRAY)
	add_text("LOG: " + outLog)
	var currLineCount = get_line_count()
	while currLineCount > 8:
		remove_paragraph(0)
		currLineCount = get_line_count()
		
	return

func OutputDevLog(outLog):
	newline()
	push_color(Color.BLUE_VIOLET)
	add_text("DEVELOPER MESSAGE: " + outLog)
	var currLineCount = get_line_count()
	while currLineCount > 8:
		remove_paragraph(0)
		currLineCount = get_line_count()
		
	return

func OutputMessageLog(outLog):
	newline()
	push_color(Color.YELLOW)
	add_text("AUTOMATED MESSAGE: " + outLog)
	var currLineCount = get_line_count()
	while currLineCount > 8:
		remove_paragraph(0)
		currLineCount = get_line_count()
		
	return

func OutputConsoleError(outLog):
	newline()
	push_color(Color.RED)
	add_text("ERROR: " + outLog)
	var currLineCount = get_line_count()
	while currLineCount > 8:
		remove_paragraph(0)
		currLineCount = get_line_count()
		
	return
