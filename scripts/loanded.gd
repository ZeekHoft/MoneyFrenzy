extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D

func play_loaned():
	animated_sprite_2d.play("loanded")

func _on_animated_sprite_2d_animation_finished():
	play_loaned()
	queue_free()
