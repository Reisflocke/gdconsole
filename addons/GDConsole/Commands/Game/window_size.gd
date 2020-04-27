extends ConsoleCommand
# set the wiindow size to Vector2(vec_x, vec_y)

func _ready():
	arguments = [c_handler.ARG_INT, c_handler.ARG_INT]


func window_size(vec_x, vec_y):
	OS.window_size = Vector2(vec_x, vec_y)
	OS.center_window()
