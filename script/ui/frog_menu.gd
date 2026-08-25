extends UIPanel

@onready var grid: GridContainer = $Panel/ScrollContainer/GridContainer
const FROG_CARD = preload("res://scene/ui/frog_card.tscn")

func _ready() -> void:
	UIManager.register_panel("unlock_frog_menu", self)

func open() -> void:
	super.open()  # garde le comportement de base (visible = true)
	for child in grid.get_children():
		child.queue_free()
	for frog in get_tree().get_nodes_in_group("Frogs"):
		var card = FROG_CARD.instantiate()
		grid.add_child(card)
		card.set_data(frog)

func _on_close_button_pressed() -> void:
	close()
