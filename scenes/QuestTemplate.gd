extends Node2D

var incomplete = true
var complete = false
var completed = false

export var NameOfQuest = ""
export var QuestDescription = ""
export var RewardDescription = ""
export var unlock_reward = {}
export var unlocks_needed = {}


func _process(delta):
	$NameOfQuestText.text = NameOfQuest
	$QuestDescriptionText.text = QuestDescription
	$RewardTextDescription.text = RewardDescription
	check_button_state()
	check_if_reward_claimed()
	

func check_if_reward_claimed():
	for i in GameGlobals.completed_quests:
		if i == NameOfQuest:
			completed = true
			


func _ready():
	check_button_state()
	for i in unlocks_needed:
		
		if i == "dodge":
			for b in unlocks_needed.values():
				if CharacterGlobals.dodge_skill > b:
					complete = true
					incomplete = false
					
					
		if i == "stanima":
			for b in unlocks_needed.values():
				if CharacterGlobals.dodge_skill > b:
					complete = true
					incomplete = false
					
		if i == "fighting":
			for b in unlocks_needed.values():
				if CharacterGlobals.fighting_skill > b:
					complete = true		
					incomplete = false
					
	
					
func check_button_state():
	if complete == true:
		$Button.text = "claim reward"
	
	if completed == true:
		$Button.text = "reward claimed"



func unlock_reward():
	if complete == true and completed == false:
		for i in unlock_reward:
			
			if i == "money":
				for b in unlock_reward.values():
					CharacterGlobals.current_money += b
					completed = true
					GameGlobals.completed_quests += [NameOfQuest]
					print(GameGlobals.completed_quests)

func _on_Button_pressed():
	unlock_reward()
