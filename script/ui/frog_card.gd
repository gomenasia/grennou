extends UIPanel

@onready var name_label: Label = $FrogCard/NameLabel
@onready var hunger_bar: ProgressBar = $FrogCard/HungerBar
@onready var love_bar: ProgressBar = $FrogCard/lovebar
@onready var splash_art: TextureRect = $FrogCard/splash_art
@onready var click_catcher: Control = $ClickCatcher

func _ready() -> void:
	UIManager.register_panel("frog_card", self)
	click_catcher.gui_input.connect(_on_click_catcher_input)

func set_data(frog: FrogClass) -> void:
	name_label.text = frog.frog_name
	hunger_bar.value = frog.hunger
	var data := FrogDatabase.get_by_id(frog.frog_id)
	if data:
		splash_art.texture = data.portrait

func _on_click_catcher_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		UIManager.close_current()
