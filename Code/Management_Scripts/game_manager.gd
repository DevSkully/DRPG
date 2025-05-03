extends Node

var rng:RandomNumberGenerator=RandomNumberGenerator.new()
var Character

var inWorld:bool : set=SetInWorld
func SetInWorld(new_value:bool)->void:
	inWorld = new_value

var Player:Player3D : set = setPlayer
func setPlayer(new_value)->void:
	Player = new_value

var Key:Variant : set=setKey
func setKey(new_value:Variant)->void:
	Key=new_value

var _gate:gate : set=set_gate
func set_gate(new_value:gate)->void:
	_gate = new_value

enum notification_state {
	_Gate=0, 
	_Enemy=1
}

const Character_Button = {
	"Knight_Normal" = "res://Assets/Icons&Buttons/Knight-Character-Button1.png",
	"Knight_Hover"  = "res://Assets/Icons&Buttons/Knight-Character-Button2.png",
	"Mage_Normal"   = "res://Assets/Icons&Buttons/Mage-Character-Button1.png",
	"Mage_Hover"    = "res://Assets/Icons&Buttons/Mage-Character-Button2.png"
}

func set_Character(newResource:String)->void:
	Character = load(newResource)

func _inst_World()->PackedScene:
	SetInWorld(true)
	return load("res://tscn/3d_World.tscn")

func Character_Selection_Window()->PackedScene:
	return load("res://tscn/Gui/CharSelect.tscn")

func _inst_Pause()->PackedScene:
	return null

func battle_scene()->PackedScene:
	SetInWorld(false)
	return load("res://tscn/instance_scene/BattleScene.tscn")

func show_notification()->PackedScene:
	return load("res://tscn/Gui/notification.tscn")

func dialog()->PackedScene:
	return load("res://tscn/UI/Message_Analog.tscn")

func pause()->void:
	if get_tree() is SceneTree:
		get_tree().paused = true
	pass

func resume()->void:
	if get_tree() is SceneTree:
		get_tree().paused = false

func _process(delta: float) -> void:
	pass
