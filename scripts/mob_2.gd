extends CharacterBody2D

var health = 5

@onready var business_man = get_node("/root/Game/businessMan")
@onready var main = get_node("/root/Game")
@onready var sfx_loanded = get_node("/root/Game/sfx_loanded")
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var anger_3_meter = $anger3_meter

var item_scene := preload("res://scenes/items.tscn")






	
	
func _physics_process(_delta):
	anger_3_meter.value = GlobalVar.mob2_speed

	
	var mob_direction = global_position.direction_to(business_man.global_position)
	velocity = mob_direction * GlobalVar.mob2_speed
	animated_sprite_2d.play("running")
	move_and_slide()

	var _player_direction = business_man.get_player_direction()
	#global_position.x is the mob then the other one is the x position of the player
	if global_position.x < business_man.global_position.x:
		animated_sprite_2d.flip_h = false
	elif global_position.x > business_man.global_position.x:
		animated_sprite_2d.flip_h = true
	
	if GlobalVar.business_reputation_health <= 0.0:
			GlobalVar.mob2_speed = 0




func take_damage():
	health -= 1
	GlobalVar.mob2_speed += 10
	sfx_loanded.playsfx()
	const LOANDED1 = preload("res://scenes/loanded.tscn")
	var loanded1 = LOANDED1.instantiate()
	get_parent().add_child(loanded1)
	
	loanded1.global_position = global_position
	if health == 0:
		sfx_loanded.playsfx()
		queue_free()
		drop_item()
		const LOANDED2 = preload("res://scenes/loanded.tscn")
		var loanded2 = LOANDED2.instantiate()
		get_parent().add_child(loanded2) #instead of being a child we're making it a sibling
		#because queue free deletes the node so no loanded animation
		loanded2.global_position = global_position
	

func drop_item():
	var item = item_scene.instantiate()
	item.position = position
	item.item_type = randi_range(0, 2)
	main.call_deferred("add_child", item)
	item.add_to_group("items")
	
	

