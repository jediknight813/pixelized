extends Control




func _ready():
	set_current_shop()



func set_current_shop():
	#hide and disable all shops
	$WeaponShopContainer.hide()
	$WeaponShopContainer.set_process(false)
	$CostumeShopContainer.hide()
	$CostumeShopContainer.set_process(false)
	
	
	#enable shop if its the current shop
	if GameGlobals.current_shop == "WeaponShop":
		$WeaponShopContainer.show()
		$WeaponShopContainer.set_process(true)
		$ItemShopName.text = "Weapon Shop"
	
	if GameGlobals.current_shop == "CostumeShop":
		$CostumeShopContainer.show()
		$CostumeShopContainer.set_process(true)
		$ItemShopName.text = "Costume Shop"





func _on_BackToMenu_pressed():
	get_tree().change_scene("res://scenes/ShopSelection.tscn")
	GameGlobals.current_shop = ""
