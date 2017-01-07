extends Node2D

var sprite
var rb
var max_move_speed = 500.0
var move_speed = 500.0

func _ready():
	self.set_process(true)
	self.set_process_input(true)
	
	rb = get_node("RigidBody")
	sprite = rb.get_node("Sprite")
	pass
	
func _process(delta):
	var cur_vel = rb.get_linear_velocity()
	var limit = 20.0
#	print(str("vel " , cur_vel))
	if(cur_vel.x > limit):
		sprite.set_animation("walk_right")
	elif(cur_vel.x < -limit):
		sprite.set_animation("walk_left")
	elif(cur_vel.y > limit):
		sprite.set_animation("walk_forward")
	elif(cur_vel.y < -limit):
		sprite.set_animation("walk_backward")
	else:
		if(sprite.get_animation() == "walk_right"):
			sprite.set_animation("idle_right")
		elif(sprite.get_animation() == "walk_left"):
			sprite.set_animation("idle_left")
		elif(sprite.get_animation() == "walk_forward"):
			sprite.set_animation("idle_forward")
		elif(sprite.get_animation() == "walk_backward"):
			sprite.set_animation("idle_backward")
			
	if(Input.is_key_pressed(KEY_LEFT)):
		rb.set_linear_velocity(- Vector2(clamp(move_speed, -max_move_speed, max_move_speed), 0.0))
	elif(Input.is_key_pressed(KEY_RIGHT)):
		rb.set_linear_velocity(Vector2(clamp(move_speed, -max_move_speed, max_move_speed), 0.0))
	elif(Input.is_key_pressed(KEY_UP)):
		rb.set_linear_velocity(- Vector2(0.0, clamp(move_speed, -max_move_speed, max_move_speed)))
	elif(Input.is_key_pressed(KEY_DOWN)):
		rb.set_linear_velocity(Vector2(0.0, clamp(move_speed, -max_move_speed, max_move_speed)))
			
	pass
	
func _input(event):
#	if(event.type == InputEvent.KEY):
		
#		var cur_vel = rb.get_linear_velocity()
#		if(event.scancode == KEY_LEFT):
#			rb.set_linear_velocity(- Vector2(clamp(move_speed, -max_move_speed, max_move_speed), 0.0))
#		elif(event.scancode == KEY_RIGHT):
#			rb.set_linear_velocity(Vector2(clamp(move_speed, -max_move_speed, max_move_speed), 0.0))
#		elif(event.scancode == KEY_UP):
#			rb.set_linear_velocity(- Vector2(0.0, clamp(move_speed, -max_move_speed, max_move_speed)))
#		elif(event.scancode == KEY_DOWN):
#			rb.set_linear_velocity(Vector2(0.0, clamp(move_speed, -max_move_speed, max_move_speed)))
	pass