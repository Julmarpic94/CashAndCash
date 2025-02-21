extends Node

var total_coins = 0  # Aquí se guardan las monedas cuando terminas el nivel
var level_coins = 0  # Monedas del nivel actual (se reinicia con cada nivel)

func save_coins():
	total_coins = level_coins  # Guarda las monedas solo al terminar el nivel

func reset_level_coins():
	level_coins = 0  # Reinicia el contador de monedas del nivel
