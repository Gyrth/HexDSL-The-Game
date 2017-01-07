extends Area2D

func _ready():
	self.set_process(true)
	
#	self.connect("area_enter", self, "area_enter");
#	self.connect("body_enter", self, "body_enter");
	pass
	
func _process(delta):
	pass
	
func area_enter(area):
#	print("Colliding!")
	pass
	
func body_enter(body):
#	print("Colliding with body in area!")
	pass