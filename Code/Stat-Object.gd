class_name Stat extends Node
## -- Variables -- ##
@export var Name   : String
@export var Health : float
@export var Attack : float
@export var Magic  : float
@export var Shield : float
@export var Sprite : Texture
# - Signal - #
signal changeHealth
signal changeAttack
signal changeMagic
signal changeShield
signal displayName
## -- Functions -- ##
# - Setters & Getters - #
func set_Health(newHealth:float)->void:
	Health = newHealth
	changeHealth.emit()
func set_Attack(newAttack:float)->void:
	Attack = newAttack
	changeAttack.emit()
func set_Magic(newMagic:float)->void:
	Magic = newMagic
	changeMagic.emit()
func set_Shield(newShield:float)->void:
	Shield = newShield
	changeShield.emit()
func set_Name(newName:String)->void:
	Name = newName
	displayName.emit()
func get_texture()->Texture:
	return Sprite
# - DAMAGE - #
