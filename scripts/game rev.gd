extends Node

var score = 0
var bank_revenue = 6000
@onready var rev_bar = %rev_bar

@onready var lost_rev = %lost_rev
@onready var game = $"../.."
@onready var score_display = %score_display
@onready var bank_rev = %"bank rev"
@onready var income = %income
@onready var final_score = %final_score
@onready var warning = %warning
@onready var gameover_label = %gameover_label
@onready var low_reputation = %low_reputation




#the add and minus function are on cash

func add_rev():
	score += 4000
	display()


func minus_rev():
	#score -= 100
	score -= 1000
	bank_revenue -= 1000
	display()
	

func regain_revenue():
	bank_revenue += 1500
	display()

#func warning():
	#if bank_revenue <= 200:
		#%gameover.visible = true

func display():
	
	var finalScore_convert = score + bank_revenue 
	var finaScore_converted = str(finalScore_convert)
	income.text = "Total Salary: " + str(score) + "₱"
	lost_rev.text = "Bank Loan: " + str(bank_revenue) + "₱"
	bank_rev.text = "Bank Loan: " + str(bank_revenue) + "₱"
	score_display.text = "Total Salary: " + str(score) + "₱"
	final_score.text = "Final Profit:" + str(finaScore_converted) + "₱"
	
	if bank_revenue <= 0:
		game._on_business_man_ruined_reputation()
		GlobalVar.shoot = false
		gameover_label.visible = true
	if bank_revenue <= 3000:
		warning.visible = true
	elif bank_revenue > 3000:
		warning.visible = false

	if GlobalVar.business_reputation_health <= 0:
		gameover_label.visible = true
	

		
	
	
	
