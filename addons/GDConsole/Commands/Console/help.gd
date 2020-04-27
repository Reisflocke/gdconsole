extends ConsoleCommand
# lists all avialb commands


# ! WIP ! this command is suppose to have different option to display differnt help text
func help():
	_output(console._format_headline("Possible commands:"))
	var cmd_handler = get_parent().get_parent()
	
	for i in range(cmd_handler.get_child_count()):
		var category = cmd_handler.get_child(i)
		_output(console._format_highlight(category.name + ": "))
		for c in range(category.get_child_count()):
			_output(category.get_child(c).name + "; ", false)
