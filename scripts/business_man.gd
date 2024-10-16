extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta): #update the physics body of interacting nodes
	#Input, detects the user input
	#get_vector, handy function it calculates 2D vector (WASD) input is being followed
	var player_direction = Input.get_vector("move_left","move_right","move_up","move_down") 
	#player speed
	velocity = player_direction * 500
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
	
	

	
	
	



