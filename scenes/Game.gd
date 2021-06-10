extends Node2D


func _ready():
	GameGlobals.game_started = true


func _process(delta):
	$CenterContainer/NameText.text = CharacterGlobals.character_name
	$DodgeText/DodgeNumber.text = str(CharacterGlobals.dodge_skill)
	$FightingText/FightingNumber.text = str(CharacterGlobals.fighting_skill)
	$MoneyNumberText.text = str(CharacterGlobals.current_money)
	


func _on_TrainingButton_pressed():
	get_tree().change_scene("res://scenes/TrainingMenu.tscn")


func _on_QuestsButton_pressed():
	get_tree().change_scene("res://scenes/QuestsMenu.tscn")


func _on_BuyItemsButton_pressed():
	get_tree().change_scene("res://scenes/ShopSelection.tscn")
