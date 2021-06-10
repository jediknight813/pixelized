extends Node2D



func check_if_game_started():
	var game_data:Directory = Directory.new()
	var save_game = File.new()
	if game_data.file_exists("user://savegame.json"):
		save_game.open("user://savegame.json", File.READ)
		var saved_Data:Dictionary = parse_json(save_game.get_as_text())
		save_game.close()
		
		print(saved_Data)
		
		GameGlobals.current_level = (saved_Data.current_level) 
		GameGlobals.target_level = (saved_Data.target_level) 
		GameGlobals.game_over = (saved_Data.game_over) 
		GameGlobals.completed_quests = (saved_Data.completed_quests) 
		GameGlobals.unlocked_items = (saved_Data.unlocked_items) 
		GameGlobals.current_shop = (saved_Data.current_shop) 
		GameGlobals.game_started = (saved_Data.game_started) 
		
		#character global data
		CharacterGlobals.character_name = (saved_Data.character_name) 
		CharacterGlobals.gender = (saved_Data.gender) 
		CharacterGlobals.outfit = (saved_Data.outfit) 
		CharacterGlobals.weapon = (saved_Data.weapon) 
		CharacterGlobals.dodge_skill = (saved_Data.dodge_skill) 
		CharacterGlobals.fighting_skill = (saved_Data.fighting_skill) 
		CharacterGlobals.current_money = (saved_Data.current_money) 
		CharacterGlobals.fighting_high_score = (saved_Data.fighting_high_score) 
		CharacterGlobals.dodge_high_score = (saved_Data.dodge_high_score) 
		CharacterGlobals.current_score = (saved_Data.current_score) 
		CharacterGlobals.add_to_stats = (saved_Data.add_to_stats) 


func _ready():
	check_if_game_started()


func _on_Button_pressed():
	if GameGlobals.game_started == false:
		get_tree().change_scene("res://scenes/CreateCharacter.tscn")
	else:
		get_tree().change_scene("res://scenes/Game.tscn")
