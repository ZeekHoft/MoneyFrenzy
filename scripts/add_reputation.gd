extends Node2D
@onready var animated_sprite_2d = $AnimatedSprite2D

func play_add_reputation():
	animated_sprite_2d.play("add")



func _on_animated_sprite_2d_animation_finished():
	play_add_reputation()
	queue_free()
