extends Node2D


@onready var game_rev = %game_rev
@onready var score_display = %score_display
@onready var mob = %mob
@onready var mob_2 = %mob2

func spaw_mob1():
	mob_2.wait_time = 3
	print("SPAWWWWnn")
	var new_mob1 = preload("res://scenes/mob1.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob1.global_position = %PathFollow2D.global_position
	add_child(new_mob1)

func spawn_mob():
	var new_mob = preload("res://scenes/mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)




func _on_timer_timeout():
	spawn_mob()
	
func _on_mob_2_timeout():
	spaw_mob1()

	
	
	
	


func _on_business_man_ruined_reputation():
	%gameover.visible = true
	score_display.text = "Final Score: " + str(game_rev.score)
	%mob.stop()





func _on_retart_pressed():
	get_tree().reload_current_scene()
	%mob.start()
	


	
