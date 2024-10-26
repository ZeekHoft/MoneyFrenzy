extends Button

@onready var gameover = %gameover
@onready var resume_button = %resume_button
@onready var pause = $"."


var isPaused = false

func pause_game():
	isPaused = true
	gameover.visible = true
	resume_button.visible = true
	GlobalVar.shoot = false

	get_tree().paused = true
func resume_game():
	isPaused = false
	gameover.visible = false
	resume_button.visible = false
	GlobalVar.shoot = true
	
	get_tree().paused = false
	
func _on_pressed():
	pause_game()
		
func _on_resume_button_pressed():
	print("heelo")
	resume_game()
	
func _on_restart_pressed():
	print("retart")
	resume_game()
	get_tree().reload_current_scene()
	
	
func _process(_delta):
	
	if Input.is_action_just_pressed("pause"):
		
		gameover.visible = true
		GlobalVar.shoot = false
		pause_game()
		
	elif  Input.is_action_just_pressed("resume"):
	
		gameover.visible = false
		GlobalVar.shoot = true
		resume_game()
	


	



