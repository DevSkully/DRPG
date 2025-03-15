class_name Character_Info
extends Control

## -- Variables -- ##
# - CHARACTER  REFERENCE- #
@onready var Character:Stat
# - PORTRIAT - #
@onready var Portait:TextureRect = $"Player-Portrait"
# - LABELS - #
@onready var Health:Label = $HealthLabel
@onready var Attack:Label = $Attack_Label
@onready var Magic :Label = $Magic_Label
@onready var Shield:Label = $Shield_Label
## -- Functions -- ##
# - PLAYER - #
func _setCharacter(newCharacter:Stat)->void:
	self.Character = newCharacter
	_connect_character()
func _getCharacter()->Stat:
	return Character
func _connect_character()->void:
	Character.changeHealth.connect(health_label)
	Health.text = str(Character.Health)
	Character.changeAttack.connect(attack_label)
	Attack.text = str(Character.Attack)
	Character.changeMagic.connect(magic_label)
	Magic.text = str(Character.Magic)
	Character.changeShield.connect(shield_label)
	Shield.text = str(Character.Shield)
	change_portait(Character.get_texture())
# - PORTRIAT - #
func change_portait(newTexture)->void:
	Portait.texture = newTexture
# - LABELS - #
func health_label()->void:
	Health.text = str(Character.Health)
func attack_label()->void:
	Attack.text = str(Character.Attack)
func magic_label()->void:
	Magic.text = str(Character.Magic)
func shield_label()->void:
	Shield.text = str(Character.Shield)
