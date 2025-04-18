class_name gate extends Node3D

@onready var door:MeshInstance3D = $MeshInstance3D
@onready var body:StaticBody3D = $StaticBody3D

@onready var field = $StaticBody3D

var tween:Tween

func _ready() -> void:
	field.name = self.name

func play_open()->void:
	body.visible = false
	tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(door, "global_transform:origin", door.global_transform.origin + Vector3(-1,0,-0.5), 1)
	tween.parallel().tween_property(door, "rotation_degrees" , door.rotation_degrees + Vector3(0,90,0), 1)

func insert_key(key:Variant)->bool:
	if key == GameManager.Key:
		play_open()
		return true
	return false
