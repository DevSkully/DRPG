extends Node

var rng:RandomNumberGenerator

var Character

func set_Character(newResource:String)->void:
	Character = load(newResource)

func _inst_World()->PackedScene:
	return load("res://tscn/3d_World.tscn")

func Character_Selection_Window()->PackedScene:
	return load("res://tscn/Gui/CharSelect.tscn")

func _inst_Pause()->PackedScene:
	return null

func _process(delta: float) -> void:
	pass
