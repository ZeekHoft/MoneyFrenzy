extends Node2D


@onready var game_rev = %game_rev
@onready var score_display = %score_display
@onready var mob = %mob
@onready var mob_2 = %mob2
@onready var mob_3 = %mob3
@onready var path_2d = $Path2D
@onready var path_follow_2d = %PathFollow2D
@onready var resume = %resume
@onready var gameover = %gameover




func spawn_mob2():
	mob_3.wait_time = 10
	print("spawn3")
	
	var new_mob2 = preload("res://scenes/mob_2.tscn").instantiate()
	path_follow_2d.progress_ratio = randf()
	new_mob2.global_position = path_follow_2d.global_position
	add_child(new_mob2)
	

func spawn_mob1():
	mob_2.wait_time = 5
	print("spawn2")

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
	gameover.visible = true
	#GlobalVar.shoot = false
	GlobalVar.business_man_speed = 0
	GlobalVar.mob_speed = 0
	GlobalVar.mob1_speed = 0
	GlobalVar.mob2_speed = 0
	mob.stop()
	mob_2.stop()
	mob_3.stop()




func _on_retart_pressed():
	get_tree().reload_current_scene()
	GlobalVar.shoot = true
	GlobalVar.business_man_speed = 300
	GlobalVar.mob_speed = 100
	GlobalVar.mob1_speed = 100
	GlobalVar.mob2_speed = 100
	GlobalVar.business_reputation_health = GlobalVar.reset_value
	mob.autostart = true
	mob_2.autostart = true
	mob_3.autostart = true



func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		_on_business_man_ruined_reputation()
		resume.visible = true
		mob.stop()
		mob_2.stop()
		mob_3.stop()
	elif  Input.is_action_just_pressed("resume"):
		_on_resume_pressed()

func _on_pause_pressed():
	_on_business_man_ruined_reputation()
	resume.visible = true
	mob.stop()
	mob_2.stop()
	mob_3.stop()
	


func _on_resume_pressed():
	gameover.visible = false
	GlobalVar.shoot = true
	mob.start()
	mob_2.start()
	mob_3.start()
	GlobalVar.business_man_speed = 300
	GlobalVar.mob_speed = 100
	GlobalVar.mob1_speed = 100
	GlobalVar.mob2_speed = 100
	GlobalVar.business_reputation_health = GlobalVar.business_reputation_health
