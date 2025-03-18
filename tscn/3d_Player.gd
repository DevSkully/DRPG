extends Node3D

const TIME_TRAVEL := 0.3

@onready var FrontRay = $Front
@onready var BackRay = $Back

var tween

func _physics_process(delta: float) -> void:
	if tween is Tween:
		if tween.is_running():
			return
	if Input.is_action_just_pressed("Up") and not FrontRay.is_colliding():
		tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		tween.tween_property(self, "transform", transform.translated(Vector3.FORWARD * 2), TIME_TRAVEL)
	if Input.is_action_just_pressed("Down") and not BackRay.is_colliding():
		tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		tween.tween_property(self, "transform", transform.translated(Vector3.BACK * 2), TIME_TRAVEL)
	if Input.is_action_just_pressed("Left"):
		tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		tween.tween_property(self, "transform:basis", transform.basis.rotated(Vector3.UP , PI / 2), TIME_TRAVEL)
	if Input.is_action_just_pressed("Right"):
		tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		tween.tween_property(self, "transform:basis", transform.basis.rotated(Vector3.UP , -PI / 2), TIME_TRAVEL)
