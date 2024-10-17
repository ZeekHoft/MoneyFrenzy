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






