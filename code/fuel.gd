extends Area2D





# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body):
		if body.is_in_group("player1"):
			get_tree().get_current_scene().get_node("player1").refuel()
			$AnimationPlayer.play("pickup")
			$CollisionShape2D.set_deferred("disabled", true)
# Replace with function body.
