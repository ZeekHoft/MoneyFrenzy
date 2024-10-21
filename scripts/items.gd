extends Area2D




@onready var income = get_node("/root/Game/score/game_rev")
@onready var bar_revenue = get_node("/root/Game/score/revenue_bar/rev_bar")


var item_type: int
var cash = preload("res://images/drop items/cash.png")
var credit = preload("res://images/drop items/credit.png")
var reputation = preload("res://images/drop items/reputation.png")
var textures = [cash, credit, reputation]

func _ready():
	$Sprite2D.texture = textures[item_type]



func _on_body_entered(body):
	var heal = 10.0
	if item_type == 0:
		income.add_rev()
	if item_type == 1:
		income.regain_revenue()
	if item_type == 2:
		#bar_revenue.value += 10
		print("picked")
	queue_free()
	

	
