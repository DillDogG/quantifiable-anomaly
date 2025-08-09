extends RichTextLabel

func OutputConsoleLog(outLog, lineCount):
	#if (get_line_count() + lineCount > 8):
		
	add_text(outLog)
	return
