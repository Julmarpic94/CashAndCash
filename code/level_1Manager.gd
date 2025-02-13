extends Node2D

var coins_collected = 0

func add_coins(amount):
	coins_collected += amount
	$UI/coin/Label.text = str(coins_collected)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
