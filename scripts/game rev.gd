extends Node

var score = 300
var lost_revenue = 300
@onready var revenue = %revenure
@onready var lost_rev = %lost_rev
@onready var game = $"../.."


func add_rev():
	score += 200
	display()


func minus_rev():
	score -= 100
	lost_revenue -= 100
	display()
	


func display():
	revenue.text = "Total Income: " + str(score)
	lost_rev.text = "Lost Revenue: " + str(lost_revenue)
	if score <= 0:
		game._on_business_man_ruined_reputation()
