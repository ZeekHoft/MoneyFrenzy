extends CharacterBody2D

var health = 2
@onready var business_man = get_node("/root/Game/businessMan")
@onready var sfx_loanded = get_node("/root/Game/sfx_loanded")
@onready var animated_sprite_2d = $AnimatedSprite2D


#var CycleCount: int = 0
#var speed: int = 1


func _physics_process(delta):

	var mob_direction = global_position.direction_to(business_man.global_position)
	velocity = mob_direction * 200
	animated_sprite_2d.play("running")
	move_and_slide()
	

	##speed over time need fix
	#CycleCount += 1
	#for i in CycleCount:
		#if i % 2000 == 0:
			#speed += 1

	
	
	var player_direction = business_man.get_player_direction()
	#global_position.x is the mob then the other one is the x position of the player
	if global_position.x < business_man.global_position.x:
		animated_sprite_2d.flip_h = false
	elif global_position.x > business_man.global_position.x:
		animated_sprite_2d.flip_h = true
	
	
func take_damage():
	health -= 1
	sfx_loanded.playsfx()
	const LOANDED1 = preload("res://scenes/loanded.tscn")
	var loanded1 = LOANDED1.instantiate()
	get_parent().add_child(loanded1) 
	loanded1.global_position = global_position
	if health == 0:

		queue_free()
		const LOANDED2 = preload("res://scenes/loanded.tscn")
		var loanded2 = LOANDED2.instantiate()
		get_parent().add_child(loanded2) #instead of being a child we're making it a sibling
		#because queue free deletes the node so no loanded animation
		loanded2.global_position = global_position


