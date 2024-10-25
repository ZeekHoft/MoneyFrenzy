extends Area2D


@onready var throw_money = %throwMoney


func _physics_process(_delta):

	var enemies_in_range = get_global_mouse_position()
	look_at(enemies_in_range)

func shoot():

	const CASH = preload("res://scenes/cash.tscn")
	var new_cash = CASH.instantiate() 
	
	new_cash.global_position = throw_money.global_position 
	new_cash.global_rotation = throw_money.global_rotation 
	throw_money.add_child(new_cash)


func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if GlobalVar.promote == true:
			shoot()
		if GlobalVar.promote == false:
			print("no promote")
	


