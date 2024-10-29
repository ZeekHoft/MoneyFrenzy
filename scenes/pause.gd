extends Button

@onready var gameover = %gameover
@onready var resume_button = %resume_button
@onready var pause = $"."
@onready var mob = %mob
@onready var mob_2 = %mob2
@onready var mob_3 = %mob3

var isPaused = false

func pause_game():
	isPaused = true
	gameover.visible = true
	resume_button.visible = true
	GlobalVar.shoot = false
	get_tree().paused = true


func bankrupt():
	isPaused = true
	gameover.visible = true
	resume_button.visible = false
	GlobalVar.shoot = false
	get_tree().paused = true

func resume_game():
	isPaused = false
	gameover.visible = false
	resume_button.visible = false
	GlobalVar.shoot = true
	get_tree().paused = false

func restart_menu():
	gameover.visible = true
	resume_button.visible = false
	
	

func _on_pressed():
	pause_game()
		
func _on_resume_button_pressed():
	print("heelo")
	resume_game()
	
func _on_restart_pressed():
	print("retart")
	resume_game()
	get_tree().reload_current_scene()
	GlobalVar.shoot = true
	
	GlobalVar.business_man_speed = 300
	GlobalVar.mob_speed = 100
	GlobalVar.mob1_speed = 100
	GlobalVar.mob2_speed = 100
	GlobalVar.bank_revenue = 20000
	GlobalVar.score = 0
	GlobalVar.business_reputation_health = GlobalVar.reset_value
	mob.autostart = true
	mob_2.autostart = true
	mob_3.autostart = true
	

#func restart():
	

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		
		gameover.visible = true
		GlobalVar.shoot = false
		pause_game()
		
	elif  Input.is_action_just_pressed("resume"):
	
		gameover.visible = false
		GlobalVar.shoot = true
		resume_game()
	


	
