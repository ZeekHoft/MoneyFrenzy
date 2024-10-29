extends Node2D


@onready var game_rev = %game_rev
@onready var score_display = %score_display
@onready var mob = %mob
@onready var mob_2 = %mob2
@onready var mob_3 = %mob3
@onready var path_2d = $Path2D
@onready var path_follow_2d = %PathFollow2D
@onready var gameover = %gameover
@onready var gameover_label = %gameover_label
@onready var resume_button = %resume_button
@onready var pause = %pause





	


func spawn_mob2():
	#print("spawn3")
	
	var new_mob2 = preload("res://scenes/mob_2.tscn").instantiate()
	path_follow_2d.progress_ratio = randf()
	new_mob2.global_position = path_follow_2d.global_position
	add_child(new_mob2)
	

func spawn_mob1():
	#print("spawn2")

	var new_mob1 = preload("res://scenes/mob1.tscn").instantiate()
	path_follow_2d.progress_ratio = randf()
	new_mob1.global_position = path_follow_2d.global_position
	add_child(new_mob1)
	

func spawn_mob():
	
	var new_mob = preload("res://scenes/mob.tscn").instantiate()
	path_follow_2d.progress_ratio = randf()
	new_mob.global_position = path_follow_2d.global_position
	add_child(new_mob)
	



func _on_timer_timeout():
	spawn_mob()
	
func _on_mob_2_timeout():
	spawn_mob1()


func _on_mob_3_timeout():
	spawn_mob2()



func _on_business_man_ruined_reputation():
	pause.bankrupt()




#func _on_restart_pressed():
	#get_tree().reload_current_scene()
	#GlobalVar.shoot = true
	#GlobalVar.business_man_speed = 300
	#GlobalVar.mob_speed = 100
	#GlobalVar.mob1_speed = 100
	#GlobalVar.mob2_speed = 100
	#GlobalVar.bank_revenue = 20000
	#GlobalVar.business_reputation_health = GlobalVar.reset_value
	#mob.autostart = true
	#mob_2.autostart = true
	#mob_3.autostart = true



#func _process(_delta):
	#if Input.is_action_just_pressed("pause"):
		#gameover.visible = true
		#resume.visible = false
		#GlobalVar.business_man_speed = GlobalVar.mob_and_player_stop
		#GlobalVar.mob_speed = GlobalVar.mob_and_player_stop
		#GlobalVar.mob1_speed = GlobalVar.mob_and_player_stop
		#GlobalVar.mob2_speed = GlobalVar.mob_and_player_stop
		#GlobalVar.shoot = false
		#resume.visible = true
		#gameover_label.visible = false
		#mob.stop()
		#mob_2.stop()
		#mob_3.stop()
	#elif  Input.is_action_just_pressed("resume"):
		#_on_resume_pressed()





	



	
