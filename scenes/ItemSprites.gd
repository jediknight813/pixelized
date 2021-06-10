extends AnimatedSprite

func _ready():
	randomize()
	play_random_animation()

func play_random_animation():
	var animations = frames.get_animation_names()
	var animation_id = randi() % animations.size()
	var animation_name = animations[animation_id]
	play(animation_name)
