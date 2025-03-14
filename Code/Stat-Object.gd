class_name Stat
extends Node

## -- Variables -- ##
@export var Name   : String
@export var Health : float
@export var Mana   : float
@export var Shield : float
@export var sprite : Sprite2D
@export var animation : AnimatedSprite2D
# - Signal - #
signal changeHealth
signal changeMana
signal changeShield
signal displayName
## -- Functions -- ##
func _enter_tree()->void:
	changeHealth.emit(Health)
	changeMana.emit(Mana)
	changeShield.emit(Shield)
	displayName.emit(Name)
func Stat(newHealth,newMana,newShield,newName)->void:
	self.Health = newHealth
	self.Mana = newMana
	self.Shield = newShield
	self.Name = newName
func _exit_tree()->void:
	# Animation on_death or exit scene tree
	pass
# - Setters & Getters - #
func set_Health(newHealth:float)->void:
	self.Health = newHealth
	changeHealth.emit(Health)
func set_Mana(newMana:float)->void:
	self.Mana = newMana
	changeMana.emit(Mana)
func set_Shield(newShield:float)->void:
	self.Shield = newShield
	changeShield.emit(Shield)
func set_Name(newName:String)->void:
	self.Name = newName
	displayName.emit(Name)
func get_Health()->float:
	return self.Health
func get_Mana()->float:
	return self.Mana
func get_Shield()->float:
	return self.Shield
func get_Name()->String:
	return self.Name
# - Damage Function - #
func On_Death()->void:
	self.queue_free()
func Take_Damage(Damage:float)->void:
	self.Health -= Damage
func Damage_calc()->void:
	pass
func Lower_Damage()->void:
	pass
func Buffer_Damage()->void:
	pass
func Heal(Heal:float)->void:
	self.Health += Heal
func GenerateShield(shield:float)->void:
	self.Shield = shield
