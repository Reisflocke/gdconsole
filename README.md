# gdconsole
A free and open source, easy to use ingame (debug)-console for the Godot Engine

**Read the DOCUMENTATION.md file in addons/GDConsole to find out how to use the Console**

You can just drag and drop this addon into your project. It has everything a ingame console needs and is easily costumizeable. It comes with a predefined set of commands which are a exsample for you to understand how to create your own one.

**Features**  
- command processing and executeing (with arguments)  
- independent command scripts (one script = one command)  
- easy command adding and editing  
- basic console features:
    - history (ui_up, ui_down)
    - toggle (ui_toggle_console)
    - predefined BBcode _formats()

**Setup ingame**  
Just drag and drop the scene into your game!
You can toggle it with "ui_toggle_console".  
*You may want to uncomment Console.gd --> func _ready(): #self.hide so the console isn't shown by default*

## Participation is welcome!

Please send me your own adjustments to the console (Pull Request) so we can make a better experience for everyone!
