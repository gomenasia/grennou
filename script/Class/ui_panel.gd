extends CanvasLayer
class_name UIPanel

func _ready():
	visible = false

func open() -> void:
	visible = true

func close() -> void:
	visible = false

func toggle() -> void:
	if visible:
		close()
	else:
		open()
