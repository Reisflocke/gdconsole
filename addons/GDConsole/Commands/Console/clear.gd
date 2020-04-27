extends ConsoleCommand
# clears the text from the current console window

onready var rset_text = console.get_node("Output").bbcode_text


func clear():
	console.get_node("Output").clear()
	_output(rset_text, false)
