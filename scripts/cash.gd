extends Area2D

var travelled_distance = 0
func _physics_process(delta):
	
	const MONEY_SPEED = 1000
	const RANGE = 1200
	
	var direction_cash = Vector2.RIGHT.rotated(rotation)#rotate the cash base on where u loan HAHAH
	
	position += direction_cash * MONEY_SPEED * delta
	
	travelled_distance += MONEY_SPEED * delta
	if travelled_distance > RANGE:
		queue_free()
		
		
	
	



func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
	
	
	
