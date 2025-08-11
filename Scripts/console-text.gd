extends RichTextLabel
class_name ConsoleUI
@export var level1 = true
@export var level2 = false
@export var level3 = false
@export var level4 = false

func _ready():
	if level1 == true:
		newline()
		push_color(Color.YELLOW)
		add_text("AUTOMATED MESSAGE: Hello, valued quality tester! In preparation for our upcoming release, we need you to play through this level and check for any glitches. Find the ‘JAR OF JAM’ to complete the level!")
		var currLineCount = get_line_count()
		while currLineCount > 8:
			remove_paragraph(0)
			currLineCount = get_line_count()
		await get_tree().create_timer(2).timeout
		newline()
		push_color(Color.YELLOW)
		add_text("AUTOMATED MESSAGE: Use the ‘A’ and ‘D’ keys to move left and right, and the Space Bar to jump! Press ‘R’ to restart the level if you get stuck. This friendly centipede will help you cross the gap!")
		currLineCount = get_line_count()
		while currLineCount > 8:
			remove_paragraph(0)
			currLineCount = get_line_count()
			
		return
	if level2 == true:
		newline()
		push_color(Color.BLUE_VIOLET)
		add_text("DEVELOPER MESSAGE: Developer here, I see you just finished the level. Looks like something is jammed up in the code, and some files got corrupted. We’re gonna have you run through the level again to make sure everything is still working.")
		var currLineCount = get_line_count()
		while currLineCount > 8:
			remove_paragraph(0)
			currLineCount = get_line_count()
		await get_tree().create_timer(3).timeout
		newline()
		push_color(Color.DARK_RED)
		add_text("ERROR: ‘Push Force’ value set to <9999999>")
		currLineCount = get_line_count()
		while currLineCount > 8:
			remove_paragraph(0)
			currLineCount = get_line_count()
		await get_tree().create_timer(3).timeout
		newline()
		push_color(Color.DARK_RED)
		add_text("ERROR: ‘Push Force’ value set to <9999999>")
		currLineCount = get_line_count()
		while currLineCount > 8:
			remove_paragraph(0)
			currLineCount = get_line_count()
			
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

func OutputConsoleError(outLog):
	newline()
	push_color(Color.RED)
	add_text("ERROR: " + outLog)
	var currLineCount = get_line_count()
	while currLineCount > 8:
		remove_paragraph(0)
		currLineCount = get_line_count()
		
	return
