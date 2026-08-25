extends UIPanel

@onready var grid: GridContainer = $Panel/GridContainer
const INVENTORY_SLOT = preload("res://scene/UI/inventory_slot.tscn")

func _ready() -> void:
	UIManager.register_panel("inventaire", self)

func open() -> void:
	super.open()
	InventoryManager.load_inventory()
	for child in grid.get_children():
		child.queue_free()
	for item_id in InventoryManager.inventory:
		var slot = INVENTORY_SLOT.instantiate()
		grid.add_child(slot)
		slot.set_item(item_id, InventoryManager.inventory[item_id])

func _on_close_button_pressed():
	close()
