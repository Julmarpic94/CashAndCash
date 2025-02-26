extends PanelContainer

var salir = "res://scenes/inicio.tscn"
var enlaceGithub ="https://julmarpic94.github.io/" 

var enlaceTutorial = "https://lucylavend.com/"
var enlaceMusica = "https://pixabay.com/es/users/audiogreen-39036832/"


func _on_enlace_3_pressed() -> void:
	OS.shell_open(enlaceGithub)


func _on_btn_volver_pressed() -> void:
	get_tree().change_scene_to_file(salir)


func _on_enlace_1_pressed() -> void:
	OS.shell_open(enlaceTutorial)


func _on_enlace_2_pressed() -> void:
	OS.shell_open(enlaceMusica)


func _on_btn_volver_mouse_entered() -> void:
	$clickBoton.play()
