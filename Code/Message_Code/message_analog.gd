class_name DialogManager
extends Control

@export var dialogLines:Array[String]
@export var dialogSound:AudioStreamPlayer
@export var dialogDestruct:bool

@onready var index = 0
@onready var dialog_box = $Dialog_Box

@onready var text_container:Label = $Dialog_Box/text

var isActive:bool

var file : set = load_csv_file
func load_csv_file(new_value:String)->Array:
	var arr: Array=[]
	
	var file = FileAccess.open(new_value, FileAccess.READ)
	if file==null:
		print("Failed to load csv file or file rendered as null")
		return arr  
	while not file.eof_reached():
		var line = file.get_line()
		arr.append( line.split(",") )
	
	file.close()
	
	return arr

func display_on_console()->void:
	var string_arr = load_csv_file("res://Assets/csv/encoded-Dialog_npc.csv")
	print(string_arr.size())
	for i in string_arr.size():
		if i + 1 == string_arr.size():
			return
		text_container.text = " ".join(string_arr[i+1]) + "\n"

func _ready() -> void:
	display_on_console()
