extends Node2D


@onready var game_rev = %game_rev
@onready var score_display = %score_display






func spawn_mob():
	var new_mob = preload("res://scenes/mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)


func _on_timer_timeout():
	spawn_mob()


func _on_business_man_ruined_reputation():
	%gameover.visible = true
	score_display.text = "Final Score: " + str(game_rev.score)
	%Timer.stop()




func _on_retart_pressed():
	get_tree().reload_current_scene()
	%Timer.start()
	
