class_name Action_Picker extends Control

@onready var Player:Player3D = GameManager.Player
@onready var Base_Controls = $Base_with_Controls
@onready var Base_Controls_children:Array = Base_Controls.get_children()

func upButton_Pressed()->void:
	Player.vertical_movement(-1)
	texture_button_modulate(Base_Controls_children[0])
func downButton_Pressed()->void:
	Player.vertical_movement(1)
	texture_button_modulate(Base_Controls_children[1])
func rightButton_Pressed()->void:
	Player.horizontal_movement(-1)
	texture_button_modulate(Base_Controls_children[2])
func leftButton_Pressed()->void:
	Player.horizontal_movement(1)
	texture_button_modulate(Base_Controls_children[3])

func texture_button_modulate(button:TextureButton)->void:
	button.set_modulate(Color(1,1,1,0.75))
	get_parent().create_timer(1).timeout
	button.set_modulate(Color(1,1,1,1))

func _ready() -> void:
	SignalBus.set_gui(self)

func _process(delta: float) -> void:
	pass
