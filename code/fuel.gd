extends Area2D


func _on_body_entered(body: Node2D) -> void:

	if body.is_in_group("player1"):
		get_tree().get_current_scene().get_node("Player1").refuel()
		$AnimationPlayer.play("pickup")
		$CollisionShape2D.set_deferred("disabled", true)
# Replace with function body.


func _on_animation_player_animation_finished(anim_name):
	queue_free()	
 # Replace with function body.
