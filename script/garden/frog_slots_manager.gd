extends Node

var current_lst_lily_pad: Array[Node2D] = []
var tracked_frog: Node2D = null
var current_selected_slot: Node2D = null

func add_potential_slot(lily_pad: Node2D, frog: Node2D) -> void:
	current_lst_lily_pad.append(lily_pad)
	tracked_frog = frog

func remove_potential_slot(lily_pad: Node2D) -> void:
	current_lst_lily_pad.erase(lily_pad)
	if lily_pad == current_selected_slot:
		lily_pad._tween_scale(lily_pad.base_scale)
		current_selected_slot = null
	if current_lst_lily_pad.is_empty():
		tracked_frog = null

func _process(_delta) -> void:
	if current_lst_lily_pad.is_empty() or not tracked_frog:
		return
	var closest_slot := find_closest_slot()
	if closest_slot != current_selected_slot:
		if current_selected_slot:
			current_selected_slot._tween_scale(current_selected_slot.base_scale)
		closest_slot._tween_scale(closest_slot.base_scale * 1.2)
		current_selected_slot = closest_slot

func find_closest_slot() -> Node2D:
	var current_closest: Node2D = null
	var closest_dist := INF
	for slot in current_lst_lily_pad:
		var d: float = slot.global_position.distance_to(tracked_frog.global_position)
		if d < closest_dist:
			closest_dist = d
			current_closest = slot
	return current_closest
