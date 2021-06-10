extends KinematicBody2D

export (int) var speed = 200
signal gameover
var velocity = Vector2()

func get_input():
	velocity = Vector2()
	velocity.y = -1

	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	
	
	
func _on_Area2D_body_entered(body):
	if body.name == "Character":
		get_tree().change_scene("res://scenes/GameOver.tscn")
