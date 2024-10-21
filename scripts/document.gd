extends Area2D



func _physics_process(delta):

	var enemies_in_range = get_global_mouse_position()
	look_at(enemies_in_range)
	
	##check if the enemies are in range
	#if enemies_in_range.size() > 0:
		##if its more then 0 there are enemies
		#var target_nemies = enemies_in_range.front()
		##returns the first index of an array -0
		#look_at(target_nemies.global_position)


func shoot():
	const CASH = preload("res://scenes/cash.tscn")
	var new_cash = CASH.instantiate() #create new cash
	
	new_cash.global_position = %throwMoney.global_position #position of throwMoney
	new_cash.global_rotation = %throwMoney.global_rotation #rotate the money as we throw is from the above codes
	#use gloabl_position for absolute position of that specific node
	#use position for only parent node, in this case the money itself
	%throwMoney.add_child(new_cash)
	

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT :
		shoot()

#func _on_button_button_down():
	#if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		#shoot()
	
#func _on_timer_timeout():
	#shoot()

