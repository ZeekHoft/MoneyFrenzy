extends Area2D


@onready var income = get_node("/root/Game/score/game_rev")
@onready var bar_revenue = get_node("/root/Game/score/revenue_bar/rev_bar")
@onready var pickup = $pickup




var item_type: int
var cash = preload("res://images/drop items/cash.png")
var credit = preload("res://images/drop items/credit.png")
var reputation = preload("res://images/drop items/reputation.png")
var textures = [cash, credit, reputation]

func _ready():
	$Sprite2D.texture = textures[item_type]

var heal = 10.0

func add_health():
	pickup.play()
	GlobalVar.business_reputation_health = min(GlobalVar.business_reputation_health + heal, 500.0)
	bar_revenue.value = GlobalVar.business_reputation_health
	


	
func _on_body_entered(_body):
	if item_type == 0:
		income.add_rev()
		pickup.play()
		
	if item_type == 1:
		income.regain_revenue()
		pickup.play()
		
		
	if item_type == 2:
		add_health()
		
		
		#print(bar_revenue.value)
	queue_free()
	

	
