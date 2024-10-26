extends Node


@onready var rev_bar = %rev_bar
@onready var lost_rev = %lost_rev
@onready var game = $"../.."
@onready var score_display = %score_display
@onready var bank_rev = %"bank rev"
@onready var income = %income
@onready var final_score = %final_score
@onready var warning = %warning
@onready var gameover_label = %gameover_label
@onready var promotion = %promotion
@onready var sfx_promotion = %sfx_promotion
@onready var sfx_bg = %sfx_bg




#the add and minus function are on cash

func add_rev():
	GlobalVar.score += 4000
	display()

func minus_salary():
	GlobalVar.score -= 10
	display()

func minus_rev():
	GlobalVar.bank_revenue -= 1000
	display()

func minus_rev_promotion():
	GlobalVar.bank_revenue -= 250
	display()

func regain_revenue():
	GlobalVar.bank_revenue += 3000
	display()

#func warning():
	#if bank_revenue <= 200:
		#%gameover.visible = true

func display():
	
	var finalScore_convert = GlobalVar.score + GlobalVar.bank_revenue

	var finaScore_converted = str(finalScore_convert)
	income.text = "Total Salary: " + str(GlobalVar.score) + " ₱"
	lost_rev.text = "Bank Loan: " + str(GlobalVar.bank_revenue) + " ₱"
	bank_rev.text = "Bank Loan: " + str(GlobalVar.bank_revenue) + " ₱"
	score_display.text = "Total Salary: " + str(GlobalVar.score) + " ₱"
	final_score.text = "Final Profit:" + str(finaScore_converted) + " ₱"
	
	if GlobalVar.bank_revenue <= 0:
		game._on_business_man_ruined_reputation()
		GlobalVar.shoot = false
		gameover_label.visible = true

	if GlobalVar.bank_revenue <= 3000:
		warning.visible = true
		
	elif GlobalVar.bank_revenue > 3000:
		warning.visible = false

	if GlobalVar.business_reputation_health <= 0:
		gameover_label.visible = true
		
		
	
	if GlobalVar.score > GlobalVar.promotion_score:
		#sfx_promotion.play()
		#sfx_bg.stop()
		promotion.visible = true
		
		
		
	if GlobalVar.score < GlobalVar.promotion_score:
		sfx_promotion.stop()
		promotion.visible = false
	

	
	
	
