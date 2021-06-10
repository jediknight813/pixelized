extends Control


func _ready():
	pass # Replace with function body.


func _on_WeaponShopButton_pressed():
	GameGlobals.current_shop = "WeaponShop"
	get_tree().change_scene("res://scenes/ItemShop.tscn")


func _on_MainMenuButton_pressed():
	get_tree().change_scene("res://scenes/Game.tscn")


func _on_CostumeShopButton2_pressed():
	GameGlobals.current_shop = "CostumeShop"
	get_tree().change_scene("res://scenes/ItemShop.tscn")
