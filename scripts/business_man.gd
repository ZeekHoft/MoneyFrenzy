# player.gd
extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var bar_revenue = get_node("/root/Game/score/revenue_bar/rev_bar")
@onready var income = get_node("/root/Game/score/game_rev")
var player_direction = Vector2.ZERO
signal ruined_reputation




var business_repuation_dmg1 = 100.0

func _physics_process(delta):
	player_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	velocity = player_direction * 300
	move_and_slide()
	
	if velocity.length() > 0.0:
		animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("idle")

	var direction = Input.get_axis("move_left", "move_right")
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
		
		
		
	const DAMAGE_REP = 50
	

	var overlapping_mobs = %reputation_box.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		GlobalVar.business_reputation_health -= DAMAGE_REP * overlapping_mobs.size() * delta
		bar_revenue.value = GlobalVar.business_reputation_health
		print(GlobalVar.business_reputation_health)
		
		#print("helth222222222: " + str(business_reputation_health))
		const STEAL_INCOME = preload("res://scenes/minus_reputation.tscn")
		var steal_income= STEAL_INCOME.instantiate()
		add_child(steal_income)
		if GlobalVar.business_reputation_health <= 0.0:
			ruined_reputation.emit()
		
	
	


# Method to get the current player direction
func get_player_direction():
	return player_direction

#func get_health():
	#return business_reputation_health
	#print(business_reputation_health)




