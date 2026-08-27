extends Node

@export var all_frogs: Array[FrogData] = [load("res://scene/frog/dragon/dragon_frog.tres")]

func get_by_id(id: String) -> FrogData:
	for data in all_frogs:
		if data.id == id:
			return data
	return null
