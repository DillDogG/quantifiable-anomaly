extends RichTextLabel
class_name ConsoleUI

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
