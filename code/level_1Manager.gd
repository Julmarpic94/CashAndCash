extends Node2D

var coins_collected = 0

func _ready():
	Global.level_coins = 0 # Inicia monedas a Cero en el global

func add_coins(amount):
	coins_collected += amount
	$UI/coin/Label.text = str(coins_collected)
	Global.level_coins = coins_collected

func update_fuel_UI(value):
	$UI/Fuel/ProgressBar.value = value
	var stylebox = $UI/Fuel/ProgressBar.get("custom_styles/fg")
	if stylebox is StyleBoxFlat:  
		var new_color = stylebox.bg_color  
		new_color.h = lerp(0.0, 0.3, value / 100)  
		stylebox.bg_color = new_color  
	if value == 0:
		$UI/Fuel/AnimationPlayer.play("alarm")
	else:
		$UI/Fuel/AnimationPlayer.play("aviso")

#Si llega a mete completa en nivel
func _on_game_over_timer_timeout() -> void:
	get_tree().reload_current_scene()
