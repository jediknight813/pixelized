extends Control

var item = preload("res://scenes/RandomItem.tscn")

var score = 0

func _ready():
	CharacterGlobals.current_score = 0
	CharacterGlobals.add_to_stats = 0
	score()
	
func score():
	yield(get_tree().create_timer(0.5),"timeout")
	score += 10
	score()
	

func _process(delta):
	CharacterGlobals.current_score = score
	$scoretext.text = str(score)
	if CharacterGlobals.dodge_high_score < score:
		CharacterGlobals.dodge_high_score = score
	

