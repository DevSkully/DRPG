class_name SpawnRoom
extends Node3D

@onready var EnemeyObject = preload("res://tscn/Enemy/Temp_Enemy.tscn")

@export var EnemyLimit:int = 6 : set = setEnemyLimit
func setEnemyLimit(new_value)->void:
	EnemyLimit = new_value
@export var Enemies:Array[Enemy]

var SpawanableRoom:Array[Node3D]

func _ready() -> void:
	var room = get_children()
	for i in range(min(EnemyLimit , room.size())):
		var random_index = randi() % room.size()
		_spawn_enemy_object_on_position(room[random_index], 1)
		print(room[random_index].name)

func _spawn_enemy_object_on_position(room:Node3D, num:int)->void:
	var _position = room.get_children()
	for i in range(min(num, _position.size())):
		var random_index = randi() % _position.size()
		spawn_enemy(_position[random_index].position, room)
		print(_position[random_index].position)

func spawn_enemy(new_value:Vector3, room:Node3D)->void:
	var inst_enemy = EnemeyObject.instantiate()
	inst_enemy.position = new_value
	room.add_child(inst_enemy)
