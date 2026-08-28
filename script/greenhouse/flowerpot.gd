extends Node2D

@onready var sprite: Sprite2D = $Sprite2D
var base_scale: Vector2

func _ready() -> void:
	base_scale = sprite.scale
	$Area2D.area_entered.connect(_on_area_entered)
	$Area2D.area_exited.connect(_on_area_exited)

func _on_area_entered(area: Area2D) -> void:
	var seed := area.get_parent()
	if seed.is_in_group("Seeds"):
		DragSlotManager.add_potential_slot(self, seed)

func _on_area_exited(area: Area2D) -> void:
	if area.get_parent().is_in_group("Frogs"):
		DragSlotManager.remove_potential_slot(self)

func _tween_scale(target_scale: Vector2) -> void:
	var tween := create_tween()
	tween.set_trans(Tween.TRANS_BACK)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(sprite, "scale", target_scale, 0.15)
