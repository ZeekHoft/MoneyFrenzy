extends Node

var score = 300
var lost_revenue = 300

@onready var lost_rev = %lost_rev
@onready var game = $"../.."

@onready var bank_rev = %"bank rev"
@onready var income = %income



#the add and minus function are on cash

func add_rev():
	score += 200
	display()


func minus_rev():
	score -= 100
	lost_revenue -= 100
	display()
	

func regain_revenue():
	lost_revenue += 50
	display()



	


func display():
	income.text = "Total Income: " + str(score)
	lost_rev.text = "Lost Revenue: " + str(lost_revenue)
	bank_rev.text = "Bank Revenue: " + str(lost_revenue)
	if score <= 0:
		game._on_business_man_ruined_reputation()
