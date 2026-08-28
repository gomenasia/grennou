extends Node

# Une entrée par objet actuellement en train d'être suivi (frog, seed, etc.)
# clé: l'objet glissé (Node2D) -> { "slots": Array[Node2D], "selected": Node2D }
var _tracked: Dictionary = {}

func add_potential_slot(slot: Node2D, item: Node2D) -> void:
	if not _tracked.has(item):
		_tracked[item] = {"slots": [], "selected": null}
	_tracked[item]["slots"].append(slot)

func remove_potential_slot(slot: Node2D, item: Node2D) -> void:
	if not _tracked.has(item):
		return
	var data: Dictionary = _tracked[item]
	data["slots"].erase(slot)
	if slot == data["selected"]:
		slot._tween_scale(slot.base_scale)
		data["selected"] = null
	if data["slots"].is_empty():
		_tracked.erase(item)

func _process(_delta: float) -> void:
	for item in _tracked.keys():
		var data: Dictionary = _tracked[item]
		if data["slots"].is_empty():
			continue
		var closest := _find_closest_slot(data["slots"], item)
		if closest != data["selected"]:
			if data["selected"]:
				data["selected"]._tween_scale(data["selected"].base_scale)
			closest._tween_scale(closest.base_scale * 1.2)
			data["selected"] = closest

func _find_closest_slot(slots: Array, item: Node2D) -> Node2D:
	var closest: Node2D = null
	var closest_dist := INF
	for slot in slots:
		var d: float = slot.global_position.distance_to(item.global_position)
		if d < closest_dist:
			closest_dist = d
			closest = slot
	return closest
