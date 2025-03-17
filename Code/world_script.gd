extends Node2D


## -- Variables -- ##
# -  Character Information - #
@onready var knight = preload("res://tscn/Object/knight.tscn")
@onready var wizard = preload("res://tscn/Object/wizard.tscn")
@onready var rogue  = preload("res://tscn/Object/rogue.tscn")
var init_Knight
var init_wizard
var init_rogue

@onready var portrait = $Portait

@onready var Char_info01:Control = $Character_Information
@onready var Char_info02:Control = $Character_Information2
@onready var Char_info03:Control = $Character_Information3

## -- Functinos -- ##
func _ready() -> void:
	init_Knight = knight.instantiate()
	Char_info01._setCharacter(init_Knight)

func _process(delta: float) -> void:
	pass
