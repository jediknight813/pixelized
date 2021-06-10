extends Node2D

var gender_picked = false

onready var character_name = get_node("GetCharacterName")


func _process(_delta):
	if len(character_name.text) < 1 and gender_picked == false:
		$StartGame.hide()
	if len(character_name.text) > 1 and gender_picked == true:
		$StartGame.show()


func _on_PickMaleGender_pressed():
	CharacterGlobals.character_name = character_name.text
	CharacterGlobals.gender = "male"
	CharacterGlobals.outfit = "ElfMale"
	gender_picked = true
	

func _on_PickFemaleGender_pressed():
	CharacterGlobals.character_name = character_name.text
	CharacterGlobals.gender = "female"
	CharacterGlobals.outfit = "ElfFemale"
	gender_picked = true


func _on_StartGame_pressed():
	GameGlobals.game_started = true
	get_tree().change_scene("res://scenes/Game.tscn")
