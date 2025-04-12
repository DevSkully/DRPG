@tool
class_name Gate extends Node3D

signal check_player_key

@onready var Open := Texture : set=setGateOpen
func setGateOpen(object)->void:
	Open = object
@onready var Close := Texture : set=setGateClose
func setGateClose(object)->void:
	Close = object
@onready var generateCollision:bool = true : set=setGenerateCollision
func setGenerateCollision(object:bool)->void:
	generateCollision = object
@onready var entry_animation:=AnimationPlayer : set=set_entry_animation
func set_entry_animation(object)->void:
	entry_animation = object

var body
var shape

func _ready() -> void:
	pass

func Collision()->void:
	if !generateCollision:
		return
	body = PhysicsServer3D.body_create()
	PhysicsServer3D.body_set_mode(body,PhysicsServer3D.BODY_MODE_STATIC)
	shape = PhysicsServer3D.concave_polygon_shape_create()
	PhysicsServer3D.shape_set_data(shape,Close)
	if is_inside_tree():
		PhysicsServer3D.body_add_shape(body,shape, global_transform)
		PhysicsServer3D.body_set_space(body, get_world_3d().space)
	PhysicsServer3D.body_set_ray_pickable(body, true)
	PhysicsServer3D.body_attach_object_instance_id(body, get_instance_id())


func change_state()->void:
	pass
