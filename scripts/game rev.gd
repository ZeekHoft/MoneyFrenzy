extends Node

var score = 300
@onready var revenue = %revenure
@onready var game = $"../.."

func add_rev():
	score += 200
	display()


func minus_rev():
	score -= 100
	display()


func display():
	revenue.text = "Total Income: " + str(score)
	if score <= 0:
		game._on_business_man_ruined_reputation()
