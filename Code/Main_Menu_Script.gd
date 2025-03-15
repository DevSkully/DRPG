extends Node2D

func _on_pressed() -> void:
	get_tree().change_scene_to_packed(GameManager._inst_World())
