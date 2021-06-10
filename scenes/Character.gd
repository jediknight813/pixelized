extends KinematicBody2D
export (int) var speed = 500
var velocity = Vector2()
const GRAVITY = 400.0

export var dodge_mode = false 
var on_ground = true

var outfit = CharacterGlobals.outfit

func _ready():
	dodge_mode = false


func _process(delta):
	$CharacterSprite.play(outfit)
	check_character_modes()
	

func _physics_process(delta):
	if dodge_mode == true:
		velocity.x += -delta * GRAVITY

		var motion = velocity * delta
		move_and_collide(motion)


func check_character_modes():
	if GameGlobals.game_over == true:
		dodge_mode = false
	
	if GameGlobals.current_level == "dodge_training" and GameGlobals.game_over == false:
		dodge_mode = true
		
	if GameGlobals.current_level == "Game_Over":
		dodge_mode = false
	
	if GameGlobals.current_level == "Main_Menu":
		dodge_mode = false
	
func _on_JumpButton_pressed():
	if on_ground == true and dodge_mode == true:
		velocity = Vector2()
		velocity.x = 100
		velocity = velocity.normalized() * speed
		

func _on_GroundArea_character_on_ground():
	on_ground = true


func _on_GroundArea_character_not_on_ground():
	on_ground = false


func _on_Area2D_body_entered(body):
	print(body.name)
	if body.name == "RandomItem":
		print(body)
		print("hit")
