extends Node2D


## -- Variables -- ##
# -  Character Information - #
@onready var knight = preload("res://tscn/Object/knight.tscn")
var init_Knight

@onready var portrait = $Portait

@onready var Char_info01:Control = $Character_Information
@onready var Char_info02:Control = $Character_Information2
@onready var Char_info03:Control = $Character_Information3

## -- Functinos -- ##
func _ready() -> void:
	init_Knight = knight.instantiate()
	Char_info01._setCharacter(init_Knight)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("A-Button"):
		init_Knight.set_Health(-10)
