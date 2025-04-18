class_name Item_Manager extends Node

@onready var key_icon = load("res://tscn/Object/item/Key.tscn")
func get_key()->Item:
	return Item.new('Key',key_icon)
@onready var coin_icon = load("res://Assets/Items/Coin.png")
func get_coin()->Item:
	return Item.new('Coin',coin_icon)
@onready var egg_icon = load("res://Assets/Items/egg.png")
func get_egg()->Item:
	return Item.new('egg',egg_icon)
@onready var stick_icon = load("res://Assets/Items/Stick.png")
func get_stick()->Item:
	return Item.new('Stick',stick_icon)
@onready var bone_icon = load("res://Assets/Items/Bone.png")
func get_bone()->Item:
	return Item.new('Bone', bone_icon)
@onready var ChickenLeg_icon = load("res://Assets/Items/ChickienLeg.png")
func get_ChickenLeg()->Item:
	return Item.new('Chicken Leg', ChickenLeg_icon)
@onready var Apple_icon = load("res://Assets/Items/Apple.png")
func get_Apple()->Item:
	return Item.new('Apple', Apple_icon)

func convert_item(item:Item,list:ItemList)->void:
	list.add_item(item.item_display,item.icon)

func get_random_item()->Item:
	match GameManager.rng.randi_range(0,6):
		1:
			return get_Apple()
		2:
			return get_ChickenLeg()
		3:
			return get_egg()
		4:
			return get_stick()
		5:
			return get_coin()
		_:
			return get_bone()
	return get_bone()
