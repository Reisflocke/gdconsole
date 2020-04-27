extends ConsoleCommand
# quit the game directly from this command script (don't use the official way with the GameManager)

func force_quit():
	get_tree().quit()
