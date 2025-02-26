extends RigidBody2D

var speed = 10000
var wheels = []
var max_speed = 250

var fuel = 100
var dead = false
var driving = 0

func _ready():
	wheels = get_tree().get_nodes_in_group("wheel")
	get_parent().update_fuel_UI(fuel)
	add_to_group("player1")
	
func _physics_process(delta):
	driving = 0
	#Salir a mitad de nivel
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://scenes/level_screen.tscn")
	
	
	# Mientras haya fuel y el jugador no esté muerto, sigue el juego
	if fuel > 0 && !dead:	
		$GameOverTimer.stop()

		# Control aereo (Rotación en el aire)
		if Input.is_action_pressed("ui_right"):  
			apply_torque_impulse(7500 * delta * 110)  # Rotación en sentido horario (derecha)

		if Input.is_action_pressed("ui_left"):  
			apply_torque_impulse(-7500 * delta * 110)  # Rotación en sentido antihorario (izquierda)

		# Movimiento hacia adelante (acelerar)
		if Input.is_action_pressed("ui_up"):
			driving += 1
			use_fuel(delta)
			for wheel in wheels:
				if wheel.angular_velocity < max_speed:
					wheel.apply_torque_impulse(speed * delta * 110)

		# Movimiento hacia atrás (marcha atrás)
		if Input.is_action_pressed("ui_down"):
			driving += 1
			use_fuel(delta)
			for wheel in wheels:
				if wheel.angular_velocity > -max_speed:
					wheel.apply_torque_impulse(-speed * delta * 110)
	#Cuando se queda sin fuel empieza el contador de cuenta atras
	else:
		if $GameOverTimer.is_stopped():
			$GameOverTimer.start() 				
	if $Casco.rotation_degrees > 90 || $Casco.rotation_degrees < -90 && !dead:
		$Caida.play()
		dead = true
		$Casco/cascoSpring.node_b = ""
		
	if driving == 1:
		$EngineSFX.pitch_scale = lerp($EngineSFX.pitch_scale, 2.0, 2.0 * delta)
		$EngineSFX.stream.loop = true
	else:
		$EngineSFX.pitch_scale = lerp($EngineSFX.pitch_scale, 1.0, 2.0 * delta)
		$EngineSFX.stream.loop = true
		
				
func refuel():
	fuel = 100
	get_parent().update_fuel_UI(fuel)
	
func use_fuel(delta):
	fuel -= 15 * delta
	fuel = clamp(fuel, 0, 1000)
	get_parent().update_fuel_UI(fuel)
	

func _on_game_over_timer_timeout() -> void:
	get_tree().reload_current_scene()
