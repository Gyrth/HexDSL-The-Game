extends Control

# class member variables
var ResolutionBox
var Resolutions = []
var WindowModeBox
var WindowModes = []
var VSyncBox
var BackButton

func _ready():
	# Initialization 
	setup_resolutions()
	setup_vsync()
	setup_window_modes()
	setup_back_button()
	pass

func setup_back_button():
	BackButton = get_node("Back")
	BackButton.connect("pressed", self, "back_pressed")
	pass

func setup_resolutions():
	ResolutionBox = get_node("Resolution")
	var cur_size = get_viewport().get_rect().size
	
	Resolutions.append([128, 72])
	Resolutions.append([256, 72])
	Resolutions.append([512, 288])
	Resolutions.append([640, 360])
	Resolutions.append([768, 432])
	Resolutions.append([1024, 576])
	Resolutions.append([1280, 720])
	Resolutions.append([1664, 936])
	Resolutions.append([1920, 1080])

	for res in Resolutions:
		ResolutionBox.add_item(str("W:", res[0], "H:", res[1]))
		if(res[0] == cur_size.x && res[1] == cur_size.y):
			ResolutionBox.select(ResolutionBox.get_item_count() - 1)

	ResolutionBox.connect("item_selected", self, "change_resolution");
	pass

func setup_vsync():
	VSyncBox = get_node("VSync")
	VSyncBox.connect("toggled", self, "change_vsync");
	pass

func setup_window_modes():
	WindowModeBox = get_node("WindowMode")
	
	WindowModes.append("Windowed")
	WindowModes.append("Windowed Borderless")
	WindowModes.append("Fullscreen")
	
	for mode in WindowModes:
		WindowModeBox.add_item(mode)
	
	if(!OS.is_window_fullscreen()):
		WindowModeBox.select(0)
	elif(OS.get_borderless_window()):
		WindowModeBox.select(1)
	elif(OS.is_window_fullscreen()):
		WindowModeBox.select(2)
	
	WindowModeBox.connect("item_selected", self, "change_window_mode");
	pass

func change_resolution(id):
	OS.set_window_size(Vector2(Resolutions[id][0], Resolutions[id][1]))
	pass

func change_vsync(pressed):
	print(str("vsync ", pressed))
	OS.set_use_vsync(pressed)
	pass

func change_window_mode(id):
	print(str("windowmode chanegd ", id))
	if(WindowModeBox.get_item_text(id) == "Fullscreen"):
		OS.set_window_fullscreen(true)
	elif(WindowModeBox.get_item_text(id) == "Windowed Borderless"):
		OS.set_window_fullscreen(false)
		OS.set_borderless_window(true)
	elif(WindowModeBox.get_item_text(id) == "Windowed"):
		OS.set_window_fullscreen(false)
		OS.set_borderless_window(false)
	pass

func back_pressed():
	var pauseWindow = load("res://ui/PauseWindow.tscn").instance()
	get_parent().add_child(pauseWindow)
	self.queue_free()
	pass