# player.gd
extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var bar_revenue = get_node("/root/Game/score/revenue_bar/rev_bar")
@onready var income = get_node("/root/Game/score/game_rev")
@onready var camera = get_node("/root/Game/businessMan/Camera2D")
@onready var low_reputation = get_node("/root/Game/low_reputation")
@onready var sfx_dmg = get_node("/root/Game/sfx_dmg")
@onready var money = $Money
@onready var promotion = $promotion


@export var random_shake_strength: float = 20.0
@export var shake_fade: float = 5.0
var rng = RandomNumberGenerator.new()
var shake_strength: float = 0.0



var player_direction = Vector2.ZERO
signal ruined_reputation


func apply_shake():
	shake_strength = random_shake_strength


	

func randomOffset() -> Vector2:
	return Vector2(rng.randf_range(-shake_strength, shake_strength),rng.randf_range(-shake_strength, shake_strength))


func add_something():
	const LOANDED = preload("res://scenes/document.tscn")
	var loanded = LOANDED.instantiate()
	get_parent().call_deferred("add_child", loanded)
	loanded.global_position = global_position

func _physics_process(delta):
	if GlobalVar.business_reputation_health < 100:
		low_reputation.visible = true
		
	if GlobalVar.business_reputation_health > 100:
		low_reputation.visible = false
	
	
	if GlobalVar.score >= GlobalVar.promotion_score:
		GlobalVar.promote = true
		promotion.visible = true

	if GlobalVar.score < GlobalVar.promotion_score:
		GlobalVar.promote = false
		promotion.visible = false
	
		
		
	player_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = player_direction * GlobalVar.business_man_speed
	#print(GlobalVar.business_man_speed)
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
	
	
	if shake_strength > 0:
		shake_strength = lerpf(shake_strength, 0, shake_fade * delta)
		camera.offset = randomOffset()
		
	
		
	const DAMAGE_REP = 50
	var overlapping_mobs = %reputation_box.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		sfx_dmg.play()
		GlobalVar.business_reputation_health -= DAMAGE_REP * overlapping_mobs.size() * delta
		
		bar_revenue.value = GlobalVar.business_reputation_health
		apply_shake()
		
		
		
		#print(GlobalVar.business_reputation_health)
		#print("helth222222222: " + str(business_reputation_health))
		const STEAL_INCOME = preload("res://scenes/minus_reputation.tscn")
		
		var steal_income= STEAL_INCOME.instantiate()
		add_child(steal_income)
		

			
		if GlobalVar.business_reputation_health <= 0.0:
			ruined_reputation.emit()
			GlobalVar.business_man_speed = 0





# Method to get the current player direction
func get_player_direction():
	return player_direction

#func get_health():
	#return business_reputation_health
	#print(business_reputation_health)




