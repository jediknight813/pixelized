extends Position2D

var box = preload("res://scenes/RandomItem.tscn")
var time = 5

func _ready():
	timer()

func timer():
	spawn_new_box()
	yield(get_tree().create_timer(time),"timeout")
	if time > 3:
		time -= 0.1
	timer()
	
	
func spawn_new_box():
	var new_box = box.instance()
	new_box.name = "RandomItem"
	add_child(new_box)
