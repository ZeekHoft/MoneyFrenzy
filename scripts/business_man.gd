# player.gd
extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
var player_direction = Vector2.ZERO

func _physics_process(delta):
	player_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")

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

# Method to get the current player direction
func get_player_direction():
	return player_direction
