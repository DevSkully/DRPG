class_name Player3D extends Node3D

signal Call_Character_Information

const TIME_TRAVEL := 0.3

@onready var FrontRay = $Front
@onready var BackRay = $Back
@onready var PlayerCamera = $Dungeon/SubViewport/Camera3D
@onready var ActionUI = $ActionPicker
@onready var _Inventory = $Inventory
@onready var Char_Info = $GUI/Character_Information

var tween
var currDirection

func _ready() -> void:
	_Inventory.visible = false
	GameManager.setPlayer(self)
	Call_Character_Information.emit(Char_Info)
	SignalBus.on_player_action_update.connect(SignalBus.update_emit)

func Camera_Position()->void:
	PlayerCamera.position = self.position
	PlayerCamera.transform.basis = self.transform.basis

func Input_3D_Movement()->void:
	if tween is Tween:
		if tween.is_running():
			return
	if Input.is_action_pressed("Up") and not FrontRay.is_colliding():
		vertical_movement(-1)
		SignalBus.movement_update(0)
	if Input.is_action_just_pressed("Down") and not BackRay.is_colliding():
		vertical_movement(1)
		SignalBus.movement_update(1)
	if Input.is_action_just_pressed("Left"):
		horizontal_movement(1)
		SignalBus.movement_update(3)
	if Input.is_action_just_pressed("Right"):
		horizontal_movement(-1)
		SignalBus.movement_update(2)

func show_inventory(value:bool)->void:
	_Inventory.visible = value
	SignalBus.system_on_press_update(value)

func vertical_movement(num:int)->void:
	tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "transform", transform.translated((num*transform.basis.z) * 2), TIME_TRAVEL)

func horizontal_movement(num:int)->void:
	tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "transform:basis", transform.basis.rotated(Vector3.UP,(num*PI)/2), TIME_TRAVEL)

func notification_open_gate(gate_value:Variant)->void:
	#TODO: pause the game-sate and return a notification window if player wants to open gate or not!
	var inst_gate = GameManager.show_notification().instantiate()
	inst_gate.setPlayer(self)
	inst_gate.set_gate(gate_value)
	self.add_child(inst_gate)

func _physics_process(delta: float) -> void:
	if FrontRay.is_colliding():
		if FrontRay.get_collider().name == 'Gate':
			notification_open_gate(FrontRay.get_collider())
	if Input.is_action_just_pressed("Select"):
		show_inventory(true if not _Inventory.visible else false)
	Input_3D_Movement()
	Camera_Position()
