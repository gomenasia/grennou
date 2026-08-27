extends Node

var panels: Dictionary = {}
var current_panel: UIPanel = null

func register_panel(key: String, panel: UIPanel) -> void:
	panels[key] = panel

func open_panel(panel: UIPanel) -> void:
	if current_panel and current_panel != panel:
		current_panel.close()
	panel.open()
	current_panel = panel

func close_current() -> void:
	if current_panel:
		current_panel.close()
		current_panel = null

func toggle(panel: UIPanel) -> void:
	if panel.visible:
		close_current()
	else:
		open_panel(panel)

# open menu tab
func toggle_inventory() -> void:
	toggle(panels.get("inventaire"))

func toggle_unlock() -> void:
	toggle(panels.get("unlock_frog_menu"))

func show_frog_card(frog: FrogClass) -> void:
	var card = panels.get("frog_card")
	if card:
		card.set_data(frog)
		toggle(card)
