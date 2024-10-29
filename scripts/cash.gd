extends Area2D


@onready var cash = get_node("/root/Game/score/game_rev")
@onready var sfx_dmg = get_node("/root/Game/sfx_dmg")
#@onready var promotion = get_node("/root/Game/businessMan/promotion")

var travelled_distance = 0
func _physics_process(delta):
	
	const MONEY_SPEED = 500
	const RANGE = 500
	
	var direction_cash = Vector2.RIGHT.rotated(rotation)#rotate the cash base on where u loan HAHAH
	
	position += direction_cash * MONEY_SPEED * delta
	
	travelled_distance += MONEY_SPEED * delta
	if travelled_distance > RANGE and GlobalVar.score <= GlobalVar.promotion_score:
		sfx_dmg.play()
		queue_free()
		cash.minus_rev()
		const LOW_INCOME = preload("res://scenes/low_incom.tscn")
		var low_income = LOW_INCOME.instantiate()
		get_parent().add_child(low_income)
	


func _on_body_entered(body):
	queue_free()
	#cash.add_rev()
	if body.has_method("take_damage"):
		body.take_damage()
		
		
