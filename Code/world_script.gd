extends Node3D

## -- Signal -- ##

## -- Variables -- ##
# -  Character Information - #
@onready var knight = preload("res://tscn/Object/knight.tscn")
@onready var wizard = preload("res://tscn/Object/wizard.tscn")
@onready var rogue  = preload("res://tscn/Object/rogue.tscn")
var init_Knight
var init_wizard
var init_rogue

@onready var portrait = $Portait
var CharInformation:Character_Info

## -- Functinos -- ##
func _ready() -> void:
	print("ready")
	init_Knight = knight.instantiate()
	CharInformation._setCharacter(init_Knight)

func _onCall_CharacterInfo(node:Character_Info)->void:
	CharInformation = node

func _process(delta: float) -> void:
	pass
