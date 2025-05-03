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
	## SHOWING DIALOG WHEN SPAWNING IN...
	init_dialog()
	for child in get_children():
		if child.name == "Rooms":
			Rooms = child

func init_dialog()->void:
	var initialize_dialog = GameManager.dialog().instantiate()
	initialize_dialog = DialogManager.new("m.person")
	self.add_child(initialize_dialog)

func _onCall_CharacterInfo(node:Character_Info)->void:
	CharInformation = node

func _process(delta: float) -> void:
	pass
