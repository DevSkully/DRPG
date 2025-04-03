extends Node3D

## -- Signal -- ##

## -- Variables -- ##
# -  Character Information - #
var init_Character = GameManager.Character.instantiate()

var CharInformation:Character_Info
var Rooms:Node3D
var Room:Array[Node3D]

## -- Functinos -- ##
func _ready() -> void:
	CharInformation._setCharacter(init_Character)
	for child in get_children():
		if child.name == "Rooms":
			Rooms = child

func _onCall_CharacterInfo(node:Character_Info)->void:
	CharInformation = node

func _process(delta: float) -> void:
	pass
