class_name gate extends Node3D

@onready var door:Node3D = $Node3D
@onready var body:StaticBody3D = $StaticBody3D

var tween:Tween

func _ready() -> void:
	body.name = self.name

func play_open()->void:
	self.remove_child(body)
	tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.parallel().tween_property(door, "rotation_degrees" , door.rotation_degrees + Vector3(0,90,0), 1)
	await get_tree().create_timer(2).timeout
	self.queue_free()

func insert_key(key:Variant)->bool:
	if key == GameManager.Key:
		play_open()
		return true
	return false
