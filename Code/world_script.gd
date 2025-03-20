extends Node3D

## -- Signal -- ##

## -- Variables -- ##
# -  Character Information - #
var init_Character = GameManager.Character.instantiate()

@onready var portrait = $Portait
var CharInformation:Character_Info

## -- Functinos -- ##
func _ready() -> void:
	print("ready")
	CharInformation._setCharacter(init_Character)

func _onCall_CharacterInfo(node:Character_Info)->void:
	CharInformation = node

func _process(delta: float) -> void:
	pass
