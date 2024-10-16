extends CharacterBody2D


@onready var business_man = get_node("/root/Game/businessMan")
@onready var animated_sprite_2d = $AnimatedSprite2D


func _physics_process(delta):
	var mob_direction = global_position.direction_to(business_man.global_position)
	velocity = mob_direction * 200.0
	animated_sprite_2d.play("running")
	move_and_slide()
	
	var player_direction = business_man.get_player_direction()
	#global_position.x is the mob then the other one is the x position of the player
	if global_position.x < business_man.global_position.x:
		animated_sprite_2d.flip_h = false
	elif global_position.x > business_man.global_position.x:
		animated_sprite_2d.flip_h = true
	
	
	
	
	
	





