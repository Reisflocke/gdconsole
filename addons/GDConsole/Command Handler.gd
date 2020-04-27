extends Node


enum { # ARGument types
	ARG_INT,
	ARG_STRING,
	ARG_BOOL,
	ARG_FLOAT
}
# NOTICE enumm string can't be accessed in the current version (see https://github.com/godotengine/godot/issues/31896)
# So ARG_TYPE_NAME stores the strings (order & size needs to match the enum)
const ARG_TYPE_NAMES = ["ARG_INT", "ARG_STRING", "ARG_BOOL", "ARG_FLOAT"]

var valid_commands = []


func _ready():
	_get_commands()


func _arg_check_type(string: String, type):
	if type == ARG_INT:
		return string.is_valid_integer()
	if type == ARG_FLOAT:
		return string.is_valid_float()
	if type == ARG_STRING:
		return true
	if type == ARG_BOOL:
		return (string == "true" or string == "false")
	return false


func _get_commands():
	for i in range(self.get_child_count()):
		var category = get_child(i)
		
		for c in range(category.get_child_count()):
			var new_command = []
			new_command.append(category.get_child(c).name) # add command name
			new_command.append(category.get_child(c).arguments) # add command arguments
			new_command.append(category.name) # add command category
			valid_commands.append(new_command)
	
	#print(str(valid_commands)) # TEST
