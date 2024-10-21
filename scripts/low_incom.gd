extends Node2D

@onready var low_income_animation = $low_income_animation

func play_low_income():
	low_income_animation.play("bad_rev")



func _on_low_income_animation_animation_finished():
	play_low_income()
	queue_free()
