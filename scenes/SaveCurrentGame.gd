extends Control


func save_game():
	var game_data_dict = {
	"current_level": GameGlobals.current_level, 
	"target_level": GameGlobals.target_level,
	"game_over": GameGlobals.game_over,
	"completed_quests": GameGlobals.completed_quests, 
	"unlocked_items": GameGlobals.unlocked_items,
	"current_shop": GameGlobals.current_shop,	
	"game_started": GameGlobals.game_started,
	
	
	"character_name": CharacterGlobals.character_name,
	"gender": CharacterGlobals.gender,
	"outfit": CharacterGlobals.outfit,
	"weapon": CharacterGlobals.weapon,
	"dodge_skill": CharacterGlobals.dodge_skill,
	"fighting_skill": CharacterGlobals.fighting_skill,
	"current_money": CharacterGlobals.current_money,
	"fighting_high_score": CharacterGlobals.fighting_high_score,
	"dodge_high_score": CharacterGlobals.dodge_high_score,
	"current_score": CharacterGlobals.current_score,
	"add_to_stats": CharacterGlobals.add_to_stats,
	
	}
	
	var 	save_game = File.new()
	save_game.open("user://savegame.json", File.WRITE)
	var dict:Dictionary = game_data_dict
	save_game.store_line(to_json(dict))
	save_game.close()
	pass


func load_game():
	var game_data:Directory = Directory.new()
	var save_game = File.new()
	if game_data.file_exists("user://savegame.json"):
		save_game.open("user://savegame.json", File.READ)
		var saved_Data:Dictionary = parse_json(save_game.get_as_text())
		save_game.close()
		
		#game global data
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
	save_game()
	load_game()

	

