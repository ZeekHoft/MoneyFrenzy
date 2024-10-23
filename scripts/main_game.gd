extends Node2D


@onready var game_rev = %game_rev
@onready var score_display = %score_display
@onready var mob = %mob
@onready var mob_2 = %mob2
@onready var path_2d = $Path2D





func spaw_mob1():
	mob_2.wait_time = 3

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
	#const LOANDED = preload("res://scenes/loanded.tscn")
	#var loanded = LOANDED.instantiate()
	#add_child(loanded)
	#loanded.global_position = path_2d.global_position

	spawn_mob()
	
func _on_mob_2_timeout():
	spaw_mob1()




var game_paused = false

func _on_business_man_ruined_reputation():
	%gameover.visible = true
	#GlobalVar.shoot = false
	GlobalVar.business_man_speed = 0
	GlobalVar.mob_speed = 0
	GlobalVar.mob1_speed = 0
	%mob2.stop()
	%mob.stop()



func _on_retart_pressed():
	get_tree().reload_current_scene()
	GlobalVar.shoot = true
	GlobalVar.business_man_speed = 300
	GlobalVar.mob_speed = 100
	GlobalVar.mob1_speed = 200
	GlobalVar.business_reputation_health = GlobalVar.reset_value



