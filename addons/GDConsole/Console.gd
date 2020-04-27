extends Panel

export var use_console = true # if set to false the console will be queued_free() as soon as the game starts
export var paused_in_console = true # the game will pause in the background, while the console is opened

#history
var history: Array # stores the history of entered commands
var history_offset: int = 0 # stores the current position in the history
#mouse re/captureing
var rcapture_mouse: bool # If the mouse MODE was capture before it will be recaptured once the console is closed

func _ready():
	#self.hide() # hide the console at game start	
	if !use_console:
		self.queue_free()


func _input(event):
	# toggle console
	if Input.is_action_just_pressed("ui_toggle_console"):
		_toggle_console()
	#use history
	if Input.is_action_just_pressed("ui_up"):
		_show_history(-1)
	elif Input.is_action_just_pressed("ui_down"):
		_show_history(1)


func _toggle_console():
	self.visible = !self.visible
	
	# manage mouse MODE
	if self.visible:
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED: rcapture_mouse = true # if the mouse was captured, recapture it when the console closes
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE) # uncapture Mouse
	elif rcapture_mouse: # if !visible & rcapture_mouse
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) # capture Mouse
	
	# grab focus
	if self.visible: $Input.grab_focus()
	# pause game in background
	if paused_in_console: get_tree().paused = self.visible


func _process_command(cmd_text):
	if cmd_text == "": # don't use empty command strings
		return
	
	_output_print_text(_format_command(cmd_text)) # print command
	history.append(cmd_text) # add command to hsitory
	history_offset = history.size() # readjust history_offset
	
	var words = cmd_text.split(" ", false) # saperate by spaces
	words = Array(words) # PoolArray to normal Array
	
	# split words into command and attributes
	var command_word = words.pop_front()
	var argument_words = words
	
	for c in $"Command Handler".valid_commands:
		if c[0] == command_word: # if command_word is a valid_command
			if argument_words.size() != c[1].size(): # stop if argument count of argument_words isn't matching the count of the valid_command-s arguments (c[1])
				_output_print_text(_format_error("Expected " + str(c[1].size()) + " arguments."))
				return
			if c[1].size() == 0: # if the commadn doesn't require an argument then just call it. There is no need to check for the type
				_call_command(command_word)
				return
			for i in range(argument_words.size()):
				if !$"Command Handler"._arg_check_type(argument_words[i], c[1][i]):
					_output_print_text(_format_error("Argument " + argument_words[i] + " is not of the expected type. Expected type: " + $"Command Handler".ARG_TYPE_NAMES[c[1][i]]))
					return
				
			_call_command(command_word, argument_words)
			return
	_output_print_text(_format_error("Command " + command_word + " does not exsist."))


func _call_command(command: String, arguments=[]):
	var category
	#get category
	for i in $"Command Handler".valid_commands:
		if i[0] == command:
			category = i[2]
	
	$"Command Handler".get_node(category + "/" + command).callv(command, arguments)


func _show_history(offset):
	if history.empty(): # no history = no history scrolling
		return
	
	if history_offset == history.size()-1 && offset == 1: # past empty string if user wants 
		$Input.text = ""
		history_offset += 1
		return
	
	history_offset = clamp(history_offset+offset, 0, history.size()-1) # keep history_offset in bounds of history
	$Input.text = history[history_offset]
	# adjust cursor position
	$Input.call_deferred("set_cursor_position", $Input.text.length()) # NOTICE you need to use call_deferred() in order for this function to work


func _output_print_text(new_text, line_break=true):
	if line_break: $Output.newline()
	$Output.append_bbcode(new_text)


func _on_Input_text_entered(new_text):
	$Input.clear()
	
	_process_command(new_text)


### ---------- TEXT FORMATS ----------

func _format_error(error_text):
	return str("[color=#fc3786]"+"ERROR: " + error_text+"[/color]")


func _format_headline(h_text):
	return str("[center][u]"+ h_text +"[/u][/center]")


func _format_highlight(h_text):
	return str("[color=#7ccc3b][b]"+ h_text +"[/b][/color]")


func _format_command(cmd_text):
	return str("[color=#c8c8c8]" + "> " + cmd_text + "[/color]")
