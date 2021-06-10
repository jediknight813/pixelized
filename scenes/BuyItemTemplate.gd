extends Control


export var item_name = ""
export var price = 0 
export var image_name = ""
export var item_type_and_value = {}

var locked = true
var unlocked = false
var equiped = false



func _ready():
	$ItemNameText.text = item_name
	$ItemPricenNumber.text = str(price)
	get_item_type_and_set_image()
	
	
func _process(delta):
	check_current_state()
	
	

func check_current_state():
	if unlocked == true:
		$BuyItemButton.text = "equip"
	if equiped == true:
		$BuyItemButton.text = "equiped"
	if item_name in GameGlobals.unlocked_items:
		unlocked = true

func get_item_type_and_set_image():
	for i in item_type_and_value:
		if i == "Weapon":
			$WeaponItems.play(image_name)


func _on_BuyItemButton_pressed():
	if CharacterGlobals.current_money > price and unlocked == false:
		CharacterGlobals.current_money -= price
		unlocked = true
		GameGlobals.unlocked_items += [item_name]


func equip_item():
	if unlocked == true:
		for i in item_type_and_value:
			if i == "Weapon":
				for b in item_type_and_value:
					CharacterGlobals.weapon = b 	
		
		
		
		
		
