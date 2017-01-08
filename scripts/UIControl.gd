extends Node2D

func _ready():
#	self.set_process(true)
	self.set_process_input(true)
	pass

func _input(event):
	if(event.type == InputEvent.KEY):
		if(Input.is_key_pressed(KEY_ESCAPE)):
			if(get_children().size() == 0):
				var pauseWindow = load("res://ui/PauseWindow.tscn").instance()
				add_child(pauseWindow)
				get_tree().set_pause(true)
	pass

func _process(delta):
	pass