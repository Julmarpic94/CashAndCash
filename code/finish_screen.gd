extends PanelContainer

var level_next = "res://scenes/level_screen.tscn"
var inicio_screen = "res://scenes/inicio.tscn"
var total_monedas = 0

func _ready():
	total_monedas = Global.total_coins  # Obtener las monedas globales
	setMonedas()  # Actualizar la UI

func setMonedas():
	$VBoxContainer/Botones/total_Monedas.text = " X " + str(total_monedas)  # Acceder correctamente a la propiedad `text`

func _on_btn_sig_level_pressed() -> void:
	get_tree().change_scene_to_file(level_next)

func _on_btn_menu_pressed() -> void:
	get_tree().change_scene_to_file(inicio_screen)


func _on_btn_sig_level_mouse_entered() -> void:
	$clickBoton.play()


func _on_btn_menu_mouse_entered() -> void:
	$clickBoton.play()
