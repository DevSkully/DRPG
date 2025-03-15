class_name Character_Info
extends Control

## -- Variables -- ##
# - PORTRIAT - #
@onready var Portait:TextureRect
# - LABELS - #
@onready var Health:Label = $HealthLabel
@onready var Attack:Label = $Attack_Label
@onready var Magic :Label = $Magic_Label
@onready var Shield:Label = $Shield_Label
## -- Functions -- ##
func _enter_tree() -> void:
	pass
func _ready() -> void:
	pass
# - PORTRIAT - #
func change_portait(newTexture:Texture)->void:
	Portait.texture = newTexture
func Injured()->void:
	pass
func Death_Display()->void:
	pass
