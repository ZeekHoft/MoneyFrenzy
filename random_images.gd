extends Sprite2D

var frames = texture.get_width() / region_rect.size.x 


func _ready():	
	var random_index = randi_range(0, 5)
	region_rect.position.x = random_index * region_rect.size.x
	

