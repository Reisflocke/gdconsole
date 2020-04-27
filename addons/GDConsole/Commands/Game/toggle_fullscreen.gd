extends ConsoleCommand
# toogle the games fullscreen setting

func toggle_fullscreen():
	OS.window_fullscreen = !OS.window_fullscreen
