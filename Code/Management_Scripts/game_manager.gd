extends Node

var rng:RandomNumberGenerator
var Character

const Character_Button = {
	"Knight_Normal" = "res://Assets/Icons&Buttons/Knight-Character-Button1.png",
	"Knight_Hover"  = "res://Assets/Icons&Buttons/Knight-Character-Button2.png",
	"Mage_Normal"   = "res://Assets/Icons&Buttons/Mage-Character-Button1.png",
	"Mage_Hover"    = "res://Assets/Icons&Buttons/Mage-Character-Button2.png"
}

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
