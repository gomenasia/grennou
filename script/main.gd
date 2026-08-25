extends Node2D

func go_to_screen(scene_path: String) -> void:
	for child in $CurrentScreen.get_children():
		child.queue_free()
	var new_screen = load(scene_path).instantiate()
	$CurrentScreen.add_child(new_screen)
