class_name Player_Manager extends Node

var Player_Pov 
var Player_on_Map 

var Front_Ray : RayCast3D
var Back_Ray  : RayCast3D

var tween
var isActive:bool

func _ready() -> void:
	pass

func _Input_2D_Movement_Direction(Direction:Vector2, player:Node2D)->void:
	if tween is Tween:
		if tween.is_running():
			return
	if Direction == Vector2(0,-1):
		tween = create_tween()
		tween.tween_property(player, "position", Vector2.UP * 2, 1)
		print("Up")
	if Direction == Vector2(0,1):
		print("Down")
	if Direction == Vector2(1,0):
		print("Right")
	if Direction == Vector2(-1,0):
		print("Left")

func _process(delta: float) -> void:
	pass
