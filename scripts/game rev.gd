extends Node

var score = 0
var bank_revenue = 300

@onready var lost_rev = %lost_rev
@onready var game = $"../.."
@onready var score_display = %score_display
@onready var bank_rev = %"bank rev"
@onready var income = %income



#the add and minus function are on cash

func add_rev():
	score += 200
	display()


func minus_rev():
	#score -= 100
	bank_revenue -= 100
	display()
	

func regain_revenue():
	bank_revenue += 50
	display()



	
func display():
	
	income.text = "Gained Income: " + str(score)
	lost_rev.text = "Lost Revenue: " + str(bank_revenue)
	bank_rev.text = "Bank Revenue: " + str(bank_revenue)
	score_display.text = "Final Score: " + str(score)
	
	if bank_revenue <= 0:
		game._on_business_man_ruined_reputation()
	
	
