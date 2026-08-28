extends DraggableClass
class_name FrogClass

const HUNGER_DECREASE_RATE = 14
@export var hunger = 100
@export var frog_name: String
@export var frog_id: String

func _ready() -> void:
	super._ready()
	add_to_group("Frogs")
	start_hunger()

func _on_area_input_event(viewport, event, shape_idx) -> void:
	super._on_area_input_event(viewport, event, shape_idx)
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_RIGHT:
		UIManager.show_frog_card(self)

func start_hunger() -> void:
	var hunger_timer = $hunger_decrease
	hunger_timer.wait_time = HUNGER_DECREASE_RATE
	hunger_timer.timeout.connect(_on_hunger_timeout)
	hunger_timer.start()

func _on_hunger_timeout() -> void:
	set_hunger(hunger - 1)

func set_hunger(new_hunger_value: float):
	hunger = max(new_hunger_value, 0)
