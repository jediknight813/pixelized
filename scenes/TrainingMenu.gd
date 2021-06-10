extends Node2D


func _on_DodgeTrainingButton_pressed():
	get_tree().change_scene("res://scenes/DodgeTrainingMiniGame.tscn")



func _on_BackButton_pressed():
	get_tree().change_scene("res://scenes/Game.tscn")


func _on_FightingTrainingButton2_pressed():
	get_tree().change_scene("res://scenes/FightingMiniGame.tscn")
