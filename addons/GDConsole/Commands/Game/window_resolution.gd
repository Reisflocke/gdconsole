extends ConsoleCommand
# Set the window_size to a predefined set of resolutions

var resolutions = {
	"nHD": Vector2(640, 360),
	"HD": Vector2(1280, 720),
	"HD+": Vector2(1600, 900),
	"FHD": Vector2(1920, 1080),
	"QHD": Vector2(2560, 1440)
}


func _ready():
	arguments = [c_handler.ARG_STRING]


func window_resolution(entered_resolution):
	if resolutions.has(entered_resolution):
		_output("Setting window to " + entered_resolution + ": " + str(resolutions[entered_resolution]))
		OS.window_size = resolutions[entered_resolution]
		OS.center_window()
	else:
		_output(console._format_error(entered_resolution + " isn't a predefined resolution. Use window_size to set the window to a costum x and y value."))
