extends Node2D


## -- Variables -- ##
# -  Character Information - #
@onready var Character = preload("res://tscn/Gui/character_information.tscn")


## -- Functinos -- ##
func _init() -> void:
	print("Desk")


func First_Character(portrait:Texture)->void:
	var init_portrait = Character.initialize()
	init_portrait.position = Vector2(32,320)
	add_child(init_portrait)
func Second_Character(portrait:Texture)->void:
	var init_portrait = Character.initialize()
	init_portrait.position = Vector2(192,320)
	add_child(init_portrait)
func Third_Character(portrait:Texture)->void:
	var init_portrait = Character.initialize()
	init_portrait.position = Vector2(352,320)
	add_child(init_portrait)
