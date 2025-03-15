extends Node

func _inst_World()->PackedScene:
	return load("res://tscn/World.tscn")

func _inst_Pause()->PackedScene:
	return null
