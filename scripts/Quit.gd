extends Control

# class member variables
var YesButton
var NoButton

func _ready():
	# Initialization 
	setup_buttons()
	pass

func setup_buttons():
	YesButton = get_node("Yes")
	NoButton = get_node("No")
	YesButton.connect("pressed", self, "yes_pressed");
	NoButton.connect("pressed", self, "no_pressed");
	pass

func yes_pressed():
	get_tree().quit()
	pass

func no_pressed():
	var settingsWindow = load("res://ui/PauseWindow.tscn").instance()
	get_parent().add_child(settingsWindow)
	self.queue_free()
	pass