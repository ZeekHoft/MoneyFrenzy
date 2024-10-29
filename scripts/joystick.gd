extends TouchScreenButton


@onready var coin: Sprite2D = $Coin
@onready var max_distnace = shape.radius

var stick_center: Vector2 = texture_normal.get_size() / 2
var touched: bool = false

func _ready():
	set_process(false)

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			set_process(true)
		elif not event.pressed:
			set_process(false)
			coin.position = stick_center
			
func _process(delta):
	coin.global_position = get_global_mouse_position()
	coin.position =stick_center + (coin.position - stick_center).limit_length(max_distnace)
	
func get_joystick_dir() -> Vector2:
	var dir = coin.position - stick_center
	return dir.normalized()
