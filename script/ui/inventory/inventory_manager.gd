extends Node

var inventory: Dictionary = {}
const SAVE_PATH := "user://save.json"

func _ready() -> void:
	load_inventory()

func add_item(id: String, amount: int = 1) -> void:
	inventory[id] = inventory.get(id, 0) + amount
	save_inventory()

func remove_item(id: String, amount: int = 1) -> bool:
	if inventory.get(id, 0) < amount:
		return false
	inventory[id] -= amount
	save_inventory()
	return true

func save_inventory() -> void:
	var file := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_string(JSON.stringify(inventory))
	file.close()

func load_inventory() -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		return
	var file := FileAccess.open(SAVE_PATH, FileAccess.READ)
	var parsed = JSON.parse_string(file.get_as_text())
	file.close()
	if parsed != null:
		inventory = parsed
