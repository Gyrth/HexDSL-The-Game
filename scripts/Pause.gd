extends Control

# class member variables
var ContinueButton
var SettingsButton
var ExitButton

func _ready():
	# Initialization 
	setup_buttons()
	self.set_process_input(true)
	pass

func setup_buttons():
	ContinueButton = get_node("Continue")
	SettingsButton = get_node("Settings")
	ExitButton = get_node("Exit")
	ContinueButton.connect("pressed", self, "continue_pressed");
	SettingsButton.connect("pressed", self, "settings_pressed");
	ExitButton.connect("pressed", self, "exit_pressed");
	pass

func continue_pressed():
	get_tree().set_pause(false)
	self.queue_free()
	pass

func settings_pressed():
	var settingsWindow = load("res://ui/SettingsWindow.tscn").instance()
	get_parent().add_child(settingsWindow)
	self.queue_free()
	pass

func exit_pressed():
	var exitWindow = load("res://ui//ExitWindow.tscn").instance()
	get_parent().add_child(exitWindow)
	self.queue_free()
	pass


func _input(event):
	if(event.type == InputEvent.KEY):
		if(Input.is_key_pressed(KEY_ESCAPE)):
			get_tree().set_pause(false)
			self.queue_free()
	pass
