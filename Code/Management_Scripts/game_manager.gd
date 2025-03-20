extends Node

var rng:RandomNumberGenerator

func _inst_World()->PackedScene:
	return load("res://tscn/3d_World.tscn")

func Character_Selection_Window()->PackedScene:
	return null

func _inst_Pause()->PackedScene:
	return null

func _process(delta: float) -> void:
	pass
