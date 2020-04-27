# Everything you need to knwo about the console!

**General Structure:**
The ConsoleCommands are handled by the "Command Hanlder".
His children are categories. You can only use first-level categories, that means that you can't create a sub-category.
A ConsoleCommand must be inside one of this categories.

**Add a category:**  
1: Add a new "Node" to the "Command Hanlder"  
2: Rename the new Nodes name to the name of the category.


**Add a ConsoleCommand:**  
1: Add a "ConsoleCommand.gd" node to the category you want to store it in.  
2: Rename it to the name of the command you want to add.  
3: Extend the script (save it in the Command directory to keep everything nice and organized)  
4: in the Script: add the command function (same name as node)  

Additional: **Add Arguments to your ConsoleCommand**  

5: if your command needs any arguments, just pass an Array containing there types into the "arguments" var (use: func _ready():)
You can enter the ARG Types enum by using c_hanlder.ARG(your argument type)  
Avaible types are:  
- ARG_FLOAT  
- ARG_INT  
- ARG_STRING  
- ARG_BOOL  

**ConsoleCommand functionallity:**  
the ConsoleCommand.gd script contains some bonus functions:  
- `_output(text, break_line=true)`: just like `Console._output_print_text()`  
- arguments: var thet contains the arguments types (Array)  
- c_handler: shortcut to the "Command Handler"  
- console: a quick shortcut to get directly to the Console node

**BBcode:**
In the console it is possible to write bbcode to make your prints more astetic and userfriendly.
[This Website](https://docs.godotengine.org/en/3.2/tutorials/gui/bbcode_in_richtextlabel.html) contains all the Godot bbcode formatting strings.
