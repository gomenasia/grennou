extends Node2D

func _ready() -> void:
	$Area2D.input_event.connect(_on_input_event)

func _on_input_event(_viewport, event, _shape_idx) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		get_tree().current_scene.go_to_screen("res://scene/house_inside/house_inside.tscn")
