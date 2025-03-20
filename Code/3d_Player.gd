extends Node3D

signal Call_Character_Information

const TIME_TRAVEL := 0.3

@onready var FrontRay = $Front
@onready var BackRay = $Back
@onready var PlayerCamera = $Dungeon/SubViewport/Camera3D
@onready var MapCamera = $SubViewportContainer/SubViewport/Camera3D

@onready var Char_Info = $GUI/Character_Information

var tween
var currDirection

func _ready() -> void:
	Call_Character_Information.emit(Char_Info)

func Camera_Position()->void:
	PlayerCamera.position = self.position
	MapCamera.position = Vector3(self.position.x,MapCamera.position.y,self.position.z)
	PlayerCamera.transform.basis = self.transform.basis

func Input_3D_Movement()->void:
	if tween is Tween:
		if tween.is_running():
			return
	if Input.is_action_just_pressed("Up") and not FrontRay.is_colliding():
		tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		tween.tween_property(self, "transform", transform.translated(-transform.basis.z * 2), TIME_TRAVEL)
	if Input.is_action_just_pressed("Down") and not BackRay.is_colliding():
		tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		tween.tween_property(self, "transform", transform.translated(transform.basis.z * 2), TIME_TRAVEL)
	if Input.is_action_just_pressed("Left"):
		tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		tween.tween_property(self, "transform:basis", transform.basis.rotated(Vector3.UP , PI / 2), TIME_TRAVEL)
	if Input.is_action_just_pressed("Right"):
		tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		tween.tween_property(self, "transform:basis", transform.basis.rotated(Vector3.UP , -PI / 2), TIME_TRAVEL)

func _physics_process(delta: float) -> void:
	Input_3D_Movement()
	Camera_Position()
