extends Area2D
signal character_on_ground
signal character_not_on_ground

func _on_GroundArea_body_entered(body):
	if body.name == "Character":
		emit_signal("character_on_ground")


func _on_GroundArea_body_exited(body):
	if body.name == "Character":
		emit_signal("character_not_on_ground")
