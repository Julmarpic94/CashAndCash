extends PanelContainer





func _on_btn_volver_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_screen.tscn")
