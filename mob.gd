extends CharacterBody2D

var health = 1

@onready var business_man = get_node("/root/Game/businessMan")
@onready var main = get_node("/root/Game")
@onready var sfx_loanded = get_node("/root/Game/sfx_loanded")
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var anger_meter = $anger_meter
var item_scene := preload("res://scenes/items.tscn")



#var CycleCount: int = 0	
#var speed: int = 1


	
	
func _physics_process(_delta):
	anger_meter.value = GlobalVar.mob_speed
	print(anger_meter.value)
	
	
	var mob_direction = global_position.direction_to(business_man.global_position)
	velocity = mob_direction * GlobalVar.mob_speed
	animated_sprite_2d.play("running")
	move_and_slide()
	##speed over time need fix
	#CycleCount += 1
	#for i in CycleCount:
		#if i % 1000 == 0:
			#speed += 1
	##print(speed)
	var _player_direction = business_man.get_player_direction()
	#global_position.x is the mob then the other one is the x position of the player
	if global_position.x < business_man.global_position.x:
		animated_sprite_2d.flip_h = false
	elif global_position.x > business_man.global_position.x:
		animated_sprite_2d.flip_h = true
		
		
	if GlobalVar.business_reputation_health <= 0.0:
			GlobalVar.mob_speed = 0
	
	
	
		
func take_damage():
	health -= 1
	GlobalVar.mob_speed += 5
	
	if health == 0:
		sfx_loanded.playsfx()
		queue_free()
		drop_item()
		const LOANDED = preload("res://scenes/loanded.tscn")
		var loanded = LOANDED.instantiate()
		get_parent().add_child(loanded) #instead of being a child we're making it a sibling
		#because queue free deletes the node so no loanded animation
		loanded.global_position = global_position
		
		
		
		
func drop_item():
	var item = item_scene.instantiate()
	item.position = position
	item.item_type = randi_range(0, 2)
	main.call_deferred("add_child", item)
	item.add_to_group("items")
	
	
	
	
#func death():
	#laonded_sfx_1.play()
	#laonded_sfx_1.connect("finished", Callable(self, "_on_laonded_sfx_1_finished"))
#
#
#func _on_laonded_sfx_1_finished():
	#queue_free()
