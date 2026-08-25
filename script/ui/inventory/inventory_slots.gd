extends Control

@export var contained_item_id = null
@export var quantity_stored = 0
@export var pos = 0

@onready var qty_display = $quantity_display

func _ready():
	qty_display.visible = false

func is_used() -> bool:
	if contained_item_id != null:
		return true
	else:
		return false

func set_item(item_id: int, quantity: int) -> void:
	contained_item_id = item_id
	if quantity > 0:
		quantity_stored = quantity
		update_quantity_display(quantity)

func update_quantity_display(quantity:int) -> void:
	if quantity != 0:
		if qty_display.visible == false:
			qty_display.visible = true
		qty_display.text = str(quantity)
	else:
		qty_display.visible = false
		qty_display.text = 0
