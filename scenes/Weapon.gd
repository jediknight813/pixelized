extends KinematicBody2D
export (int) var speed = 00
var velocity = Vector2()


var weapon = CharacterGlobals.weapon

export var FightMiniGameMode = false

var sword_speed = -2000

var target_hit = false

var starting_position_x
var starting_position_y


func _ready():
	starting_position_x = position.x
	starting_position_y = position.y
 

func _process(delta):
	$WeaponSprite.play(weapon)
	check_current_mode()

func _physics_process(delta):
	if FightMiniGameMode == true and target_hit == false: 
		velocity.y += delta

		var motion = velocity * delta
		move_and_collide(motion)


func check_current_mode():
	if GameGlobals.current_level == "Fighting_Training":
		FightMiniGameMode = true
	if GameGlobals.current_level == "Game_Over":
		FightMiniGameMode = false


func _on_Area2D_body_entered(body):
	if FightMiniGameMode == true:
		if body.is_in_group("target"):
			self.position.x = starting_position_x
			self.position.y = starting_position_y
			target_hit = true
			
			
func _on_AttackButton_pressed():
	target_hit= false
	if FightMiniGameMode == true:
		velocity = Vector2()
		velocity.y = sword_speed
