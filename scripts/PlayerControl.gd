extends Node2D

var sprite
var rb
var occluder
var move_speed = 200.0

var occlusion_right_walk = load("res://character/occlusion_right_walk.tres")
var occlusion_right_idle = load("res://character/occlusion_right_idle.tres")
var occlusion_left_walk = load("res://character/occlusion_left_walk.tres")
var occlusion_left_idle = load("res://character/occlusion_left_idle.tres")
var occlusion_idle = load("res://character/occlusion_idle.tres")

func _ready():
	self.set_process(true)
	self.set_process_input(true)
	
	rb = get_node("RigidBody")
	sprite = rb.get_node("Sprite")
	occluder = rb.get_node("LightOccluder2D")
	pass
	
func _process(delta):
	var cur_vel = rb.get_linear_velocity()
	var limit = 20.0
	
#	print(str("vel " , cur_vel))
	if(cur_vel.x > limit):
		sprite.set_animation("walk_right")
		occluder.set_occluder_polygon(occlusion_right_walk)
	elif(cur_vel.x < -limit):
		sprite.set_animation("walk_left")
		occluder.set_occluder_polygon(occlusion_left_walk)
	elif(cur_vel.y > limit):
		sprite.set_animation("walk_forward")
		occluder.set_occluder_polygon(occlusion_idle)
	elif(cur_vel.y < -limit):
		sprite.set_animation("walk_backward")
		occluder.set_occluder_polygon(occlusion_idle)
	else:
		if(sprite.get_animation() == "walk_right"):
			sprite.set_animation("idle_right")
			occluder.set_occluder_polygon(occlusion_right_idle)
		elif(sprite.get_animation() == "walk_left"):
			sprite.set_animation("idle_left")
			occluder.set_occluder_polygon(occlusion_left_idle)
		elif(sprite.get_animation() == "walk_forward"):
			sprite.set_animation("idle_forward")
			occluder.set_occluder_polygon(occlusion_idle)
		elif(sprite.get_animation() == "walk_backward"):
			sprite.set_animation("idle_backward")
			occluder.set_occluder_polygon(occlusion_idle)
			
	if(Input.is_key_pressed(KEY_LEFT)):
		rb.set_linear_velocity(- Vector2(move_speed, 0.0))
	elif(Input.is_key_pressed(KEY_RIGHT)):
		rb.set_linear_velocity(Vector2(move_speed, 0.0))
	elif(Input.is_key_pressed(KEY_UP)):
		rb.set_linear_velocity(- Vector2(0.0, move_speed))
	elif(Input.is_key_pressed(KEY_DOWN)):
		rb.set_linear_velocity(Vector2(0.0, move_speed))
			
	pass
	
func _input(event):

	pass