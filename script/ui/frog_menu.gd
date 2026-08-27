extends UIPanel

@onready var grid: GridContainer = $Panel/ScrollContainer/GridContainer
const FROG_CARD = preload("res://scene/ui/frog_card.tscn")

func _ready() -> void:
	UIManager.register_panel("unlock_frog_menu", self)

func open() -> void:
	pass

func _on_close_button_pressed() -> void:
	close()
