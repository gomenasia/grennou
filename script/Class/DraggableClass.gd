extends Node2D
class_name DraggableClass

@export var slot_group: String  # "FrogSlots" ou "FlowerPots"

var dragging: bool = false
var drag_offset: Vector2 = Vector2.ZERO
var start_position: Vector2 = Vector2.ZERO

func _ready() -> void:
	$Area2D.input_event.connect(_on_area_input_event)

func _on_area_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		dragging = true
		start_position = global_position
		drag_offset = global_position - get_global_mouse_position()
		z_index = 1

func _input(event: InputEvent) -> void:
	if dragging and event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			dragging = false
			z_index = 0
			_try_snap_or_return()

func _process(_delta: float) -> void:
	if dragging:
		global_position = get_global_mouse_position() + drag_offset

func _try_snap_or_return() -> void:
	var destination := start_position
	var current_overlapping: Array[Node2D] = []
	for area in $Area2D.get_overlapping_areas():
		current_overlapping.append(area.get_parent())
	if not current_overlapping.is_empty():
		var distance := INF
		for slot in current_overlapping:
			var current_dist: float = slot.global_position.distance_to(global_position)
			if slot.is_in_group(slot_group) and current_dist < distance:
				destination = slot.global_position
				distance = current_dist
	var tween := create_tween()
	tween.set_trans(Tween.TRANS_BACK)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "global_position", destination, 0.3)
