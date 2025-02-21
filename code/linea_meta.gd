extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player1"):
		print("¡Meta alcanzada!")
		Global.total_coins = Global.level_coins #guardo monedas en la varible total del global
		call_deferred("change_scene")

func change_scene():
	await get_tree().create_timer(2).timeout #Termina al curzar meta
	get_tree().change_scene_to_file("res://scenes/finish_screen.tscn")
