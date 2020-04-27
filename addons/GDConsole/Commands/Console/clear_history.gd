extends ConsoleCommand
# clear the console.history --> history = []

func clear_history():
	console.history = []
	console.history_offset = 0
