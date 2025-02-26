extends PanelContainer

var level_scene = "res://scenes/level_screen.tscn"
var creditos_screen = "res://scenes/opciones_screen.tscn"



func _on_btn_start_pressed() -> void:
	get_tree().change_scene_to_file(level_scene)	

func _on_btn_opcion_pressed() -> void:
	get_tree().change_scene_to_file(creditos_screen)

func _on_btn_salir_pressed():
	get_tree().quit()


func _on_btn_start_mouse_entered() -> void:
	$clikBoton.play()


func _on_btn_opcion_mouse_entered() -> void:
	$clikBoton.play()


func _on_btn_salir_mouse_entered() -> void:
	$clikBoton.play()
