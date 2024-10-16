extends CharacterBody2D


func _physics_process(delta): #update the physics body of interacting nodes
	#Input, detects the user input
	#get_vector, handy function it calculates 2D vector (WASD) input is being followed
	var player_direction = Input.get_vector("move_left","move_right","move_up","move_down") 
	#player speed
	velocity = player_direction * 500
	move_and_slide()
	#the function get_node is built in, we're refencing code from happyboo to get its animation
	
	if velocity.length() > 0.0:
		#get_node("HappyBoo").play_walk_animation()
		#$HappyBoo.play_walk_animation()
		
		#we've made HappyBoo node a unique name, now anytime if we were to change heirarchy there woudn't be much of a problem
		%HappyBoo.play_walk_animation()
	else:
		#get_node("HappyBoo").play_idle_animation()
		#$HappyBoo.play_idle_animation()
		%HappyBoo.play_idle_animation()
	
	
	



