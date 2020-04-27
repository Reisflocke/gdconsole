extends Node
class_name ConsoleCommand

var arguments = []

onready var console = get_node("../../..") # owner
onready var c_handler = console.get_node("Command Handler")


func _ready(): # DEBUG
	if c_handler == null:
		print("ConsoleCommand [" + self.name + "] isn't a sub-child of [Command Handler]! --> This Node will be queued_free() to prevend Errors.")
		self.queue_free()

# NOTICE: not working. All extension have to be a tool for this to work, so I decided against it!
##func _get_configuration_warning() -> String:
#	return "Not a subchild of Command Hnalder" if not c_handler else ""


func _output(output_text, line_break=true):
	console._output_print_text(output_text, line_break)
