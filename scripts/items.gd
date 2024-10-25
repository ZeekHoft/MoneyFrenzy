extends Area2D


@onready var income = get_node("/root/Game/score/game_rev")
@onready var bar_revenue = get_node("/root/Game/score/revenue_bar/rev_bar")
@onready var sfx_pickup = get_node("/root/Game/sfx_pickup")





var item_type: int
var cash = preload("res://images/drop items/cash.png")
var credit = preload("res://images/drop items/credit.png")
var reputation = preload("res://images/drop items/reputation.png")
var textures = [cash, credit, reputation]

func _ready():
	$Sprite2D.texture = textures[item_type]

var heal = 10.0

func add_health():
	
	GlobalVar.business_reputation_health = min(GlobalVar.business_reputation_health + heal, 500.0)
	bar_revenue.value = GlobalVar.business_reputation_health
	GlobalVar.business_man_speed += 10
	
	


	
func _on_body_entered(_body):
	if item_type == 0:
		sfx_pickup.play()
		income.add_rev()
	
		
	if item_type == 1:
		sfx_pickup.play()
		income.regain_revenue()
	

	if item_type == 2:
		
		sfx_pickup.play()
		add_health()
		
		
		
		#print(bar_revenue.value)
	
	queue_free()
	

	
