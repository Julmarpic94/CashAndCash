extends RigidBody2D


var speed = 6000
var wheels = []
var max_speed = 50

var fuel = 100

func _ready():
	wheels = get_tree().get_nodes_in_group("wheel")
	
func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		for wheel in wheels:
			if wheel.angular_velocity < max_speed:
				wheel.apply_torque_impulse(speed * delta * 60)
				
	if Input.is_action_pressed("ui_left"):
		for wheel in wheels:
			if wheel.angular_velocity > -max_speed:
				wheel.apply_torque_impulse(-speed * delta * 60)
				
func refuel():
	fuel = 100
