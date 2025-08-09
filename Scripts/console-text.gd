extends RichTextLabel

func OutputConsoleLog(outLog):
	newline()
	push_color(Color(115, 119, 124))
	add_text(outLog)
	var currLineCount = get_line_count()
	while currLineCount > 8:
		remove_paragraph(0)
		currLineCount = get_line_count()
		
	return

func OutputConsoleError(outLog):
	newline()
	push_color(Color.RED)
	add_text(outLog)
	var currLineCount = get_line_count()
	while currLineCount > 8:
		remove_paragraph(0)
		currLineCount = get_line_count()
		
	return
