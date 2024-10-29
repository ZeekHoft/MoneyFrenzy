extends Button

signal shoot_laon
var reference_document = preload("res://scenes/document.tscn")


func _on_pressed() -> void:
	shoot_laon.emit()
