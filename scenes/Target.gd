extends KinematicBody2D


export (int) var speed = 200
var velocity = Vector2()

func get_input():
	velocity = Vector2()
	velocity.x = -1

	velocity = velocity.normalized() * speed


func _ready():
	self.add_to_group("target")

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)


func _on_Area2D_body_entered(body):
	if body.name == "LeftWall":
		speed = -speed + -GameGlobals.target_level * 0.5
		self.scale.x *= -1
		
	if body.name == "RightWall":
		speed = abs(speed + GameGlobals.target_level * 0.5)
		self.scale.x *= -1
		
		
	if body.name == "Weapon":
		CharacterGlobals.fighting_high_score += 50
		CharacterGlobals.current_score += 50
		GameGlobals.targets_remaining -= 1
		self.queue_free()
		
		
		
		
