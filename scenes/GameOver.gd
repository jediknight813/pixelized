extends Control

var dodge_game_over = false
var fighting_game_over = false


func _ready():
	GameGlobals.game_over = true
	
	
	if GameGlobals.current_level == "dodge_training":
		dodge_game_over = true
		CharacterGlobals.add_to_stats = float(CharacterGlobals.current_score) / float(100)
		CharacterGlobals.dodge_skill += CharacterGlobals.add_to_stats
		
	if GameGlobals.current_level == "Fighting_Training":
		fighting_game_over = true
		CharacterGlobals.add_to_stats = float(CharacterGlobals.current_score) / float(100)
		CharacterGlobals.fighting_skill += CharacterGlobals.add_to_stats
	

func _process(delta):
	if dodge_game_over == true:
		$hi_scoreText.show()
		$scoreText.show()
		$scoreNumber.text = str(CharacterGlobals.current_score)
		$GameModeText.text = "-dodge training-"
		$hi_scoreNumber.text = str(CharacterGlobals.dodge_high_score)
		$StatText.text = "dodging: + "
		$StatNumber.text = str(CharacterGlobals.add_to_stats)
	
	
	if fighting_game_over == true:
		$hi_scoreText.show()
		$scoreText.show()
		$scoreNumber.text = str(CharacterGlobals.current_score)
		$GameModeText.text = "-fight training-"
		$hi_scoreNumber.text = str(CharacterGlobals.fighting_high_score)
		$StatText.text = "fighting: + "
		$StatNumber.text = str(CharacterGlobals.add_to_stats)


func _on_RetryButton_pressed():
	GameGlobals.game_over = false
	if dodge_game_over == true:
		get_tree().change_scene("res://scenes/DodgeTrainingMiniGame.tscn")
	
	if fighting_game_over == true:
		get_tree().change_scene("res://scenes/FightingMiniGame.tscn")
	
	
func _on_MainMenuButton_pressed():
	GameGlobals.game_over = false
	get_tree().change_scene("res://scenes/Game.tscn")
