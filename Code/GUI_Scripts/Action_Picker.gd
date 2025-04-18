class_name Action_Picker extends Control

@onready var Player:Player3D = GameManager.Player
@onready var Base_Controls = $Base_with_Controls
@onready var Base_Controls_children:Array = Base_Controls.get_children()
@onready var BattleScene = $BattleScene
@onready var Item_Button = $Base_with_Controls/Item_Button

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
func ItemButton_Pressed()->void:
	texture_button_modulate(Item_Button)

func texture_button_modulate(button:TextureButton)->void:
	button.set_modulate(Color(1,1,1,0.75))
	await get_tree().create_timer(0.2).timeout
	button.set_modulate(Color(1,1,1,1))

func item_button_modulate(value:bool)->void:
	if value:
		Item_Button.set_modulate(Color(0.75,0.75,0.75,.45))
	else:
		Item_Button.set_modulate(Color(1,1,1,1))

func _ready() -> void:
	SignalBus.set_gui(self)

func switch_control_user_interface()->void:
	if !GameManager.inWorld:
		Base_Controls.visible = false
		BattleScene.visible = true
	else :
		Base_Controls.visible = true
		BattleScene.visible = false
