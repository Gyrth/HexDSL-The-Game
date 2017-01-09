extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var elapsed_time = 0.0
var StartButton
var ExitButton

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	self.set_process(true)
	OS.set_window_maximized(true)

	StartButton = get_node("Start")
	ExitButton = get_node("Exit")
	StartButton.connect("pressed", self, "start_pressed");
	ExitButton.connect("pressed", self, "exit_pressed");

	pass

func start_pressed():
	get_tree().change_scene("res://HexDSL - The Game.tscn")
	pass

func exit_pressed():
	get_tree().quit()
	pass