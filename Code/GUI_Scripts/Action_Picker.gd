extends Control

@onready var Player:Player3D = GameManager.Player

func upButton_Pressed()->void:
	Player.vertical_movement(-1)
func downButton_Pressed()->void:
	Player.vertical_movement(1)
func rightButton_Pressed()->void:
	Player.horizontal_movement(-1)
func leftButton_Pressed()->void:
	Player.horizontal_movement(1)

func _process(delta: float) -> void:
	Player = GameManager.Player
	if !Player:
		print("whay?>")
