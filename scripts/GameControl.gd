extends Node2D

var rb
var animation_player
var collision
var reset = false

func _ready():
	self.set_process(true)
	
	rb = get_node("RigidBody2D")
	animation_player = rb.get_node("AnimationPlayer")
	collision = rb.get_node("Collision")
#	get_node("RigidBody2D").connect("body_enter", self, "body_enter");
	rb.get_node("Area2D").connect("area_enter", self, "area_enter");
	rb.get_node("Area2D").connect("body_enter", self, "body_enter");
	animation_player.connect("finished", self, "do_anim_finished")
	pass

func area_enter(area):
#	print(str("Colliding with area2d! ", area.get_name()))
	var name = area.get_name()
	if(name == "ResetTrigger_Top_Left"):
		animation_player.play("lost_left_top")
	elif(name == "ResetTrigger_Top_Right"):
		animation_player.play("lost_right_top")
	elif(name == "ResetTrigger_Bottom_Left"):
		animation_player.play("lost_left_bottom")
	elif(name == "ResetTrigger_Bottom_Right"):
		animation_player.play("lost_right_bottom")
	if(animation_player.is_playing()):
		reset = true
	pass

func do_anim_finished():
	if(reset):
		rb.set_linear_velocity(Vector2(0,0))
		rb.set_angular_velocity(0.0)
		rb.set_pos(Vector2(0,0))
		rb.set_rot(0.0)
		animation_player.play("roll_in")
		reset = false
	pass
	
func body_enter(body):
#	print("Colliding with body in area in main game!")
	pass

func _process(delta):
	pass
