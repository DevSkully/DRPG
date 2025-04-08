class_name BattleSene extends Node3D

@onready var Player_Position = $PlayerPosition
@onready var Enemy_Position = $EnemyPosition

var _Player:Player3D : set=setPlayer
func setPlayer(new_value)->void:
	_Player = new_value
var _Enemy : set=setEnemy
func setEnemy(new_value)->void:
	_Enemy = new_value

func _ready() -> void:
	pass

func player_on_ready()->void:
	_Player.ActionUI.
