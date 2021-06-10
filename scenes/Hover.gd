extends KinematicBody2D

export var time = 0

export (int) var speed = 200
var up = false
var down = true

var velocity = Vector2()

func timer():
	yield(get_tree().create_timer(time), "timeout")
	if up == true:
		up = false
		down = true
		timer()
	else:
		up = true
		down = false
		timer()
	
	
func _ready():
	timer()


func hover():
	velocity = Vector2()
	if up == true:
		velocity.y += 0.1
	else:
		velocity.y += -0.1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	hover()
	velocity = move_and_slide(velocity)
