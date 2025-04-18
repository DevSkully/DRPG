class_name notification extends Control

@onready var notif_gate = $notification_gate
@onready var notif_enemey = $notification_enemy
@onready var notif_death = $notification_death

var player:set=setPlayer
func setPlayer(new_value:Variant)->void:
	player = new_value
var _gate:set=set_gate
func set_gate(new_value:Variant)->void:
	_gate = new_value

func _ready() -> void:
	pass

func open_gate()->void:
	#TODO : check if player has key and play @Gate.open()
	#TODO : if player has 'key' in inventory
	for child in player.Inventory:
		pass
	pass

func option_no_gate()->void:
	pass
