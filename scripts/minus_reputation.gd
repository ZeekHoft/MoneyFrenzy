extends Node2D
@onready var animated_sprite_2d = $AnimatedSprite2D

func play_minus_reputation():
	animated_sprite_2d.play("minus rep")



func _on_animated_sprite_2d_animation_finished():
	play_minus_reputation()
	queue_free()
