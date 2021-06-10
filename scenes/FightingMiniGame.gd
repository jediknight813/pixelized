extends Control
var target = preload("res://scenes/Target.tscn")
var spawn_positions = []
var targets
var game_over = false

signal next_level

func _ready():
	GameGlobals.target_level = 0
	CharacterGlobals.current_score = 0
	GameGlobals.targets_remaining = 0
	spawn_positions = [$SpawnPostion, $SpawnPostion2, $SpawnPostion3, $SpawnPostion4]
	spawn_new_targets()
	
	
func _process(delta):
	$ScoreNumberText.text = str(CharacterGlobals.current_score)
	if GameGlobals.targets_remaining == 0:
		spawn_new_targets()
		GameGlobals.target_level += 1
		
		
func spawn_new_targets():
	while  GameGlobals.targets_remaining < 4:
		for i in spawn_positions:
			GameGlobals.targets_remaining += 1
			var new_target = target.instance()
			new_target.position = i.position
			add_child(new_target)



func _on_GameOver_body_entered(body):
	if body.name == "Weapon":
		get_tree().change_scene("res://scenes/GameOver.tscn")
