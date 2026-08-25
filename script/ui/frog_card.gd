extends PanelContainer

@onready var name_label: Label = $VBoxContainer/NameLabel
@onready var hunger_bar: ProgressBar = $VBoxContainer/HungerBar

func set_data(frog: FrogClass) -> void:
	name_label.text = frog.frog_name
	hunger_bar.value = frog.hunger
 
