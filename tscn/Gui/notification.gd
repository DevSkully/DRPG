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
	self.process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	await get_tree().create_timer(0.1).timeout
	GameManager.pause()

func open_gate()->void:
	#TODO : check if player has key and play @Gate.open()
	#TODO : if player has 'key' in inventory
	for child in player.Inventory:
		pass
	pass

func _notification_Gate_Yes()->void:
	GameManager.resume()
	self.get_parent().remove_child(self)
	_gate.get_parent().play_open()

func _notification_Gate_No()->void:
	GameManager.resume()
	self.get_parent().remove_child(self)

func option_no_gate()->void:
	pass
