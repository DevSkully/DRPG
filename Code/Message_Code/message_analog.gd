class_name DialogManager
extends Control

@export var dialogLines:Array[String]
@export var dialogSound:AudioStreamPlayer
@export var dialogDestruct:bool

@onready var index = 0
@onready var dialog_box = $Dialog_Box

@onready var text_container:Label = $Dialog_Box/text

var isActive:bool
var dialog_value:String
var dialog_container:Array = []

var csv_file:Array=[]

func load_csv_file(new_value:String)->Array:
	var arr: Array=[]
	var file = FileAccess.open(new_value, FileAccess.READ)
	if file==null:
		print("Failed to load csv file or file rendered as null")
		return arr  
	while not file.eof_reached():
		var line = file.get_line()
		var cells:PackedStringArray = line.split(",")
		var normal_arr: Array = []
		for items in cells:
			normal_arr.append(items)
		arr.append(normal_arr)
	file.close()
	
	csv_file = arr
	return arr

func display_on_console()->void:
	var string_arr = load_csv_file("res://Assets/csv/encoded-Dialog_npc.csv")
	for i in range(1, string_arr.size() - 1):
		var row = string_arr[i]
		if row is Array and row.size()>1:
			print("arr at: " , i , " | ", row[0])
		else:
			print('Skipping row', i , ': Invalid or too short')

func get_dialog(base:String, file_path:String)->void:
	var string_arr = load_csv_file(file_path)
	
	var dialog_arr:Array=[]
	for col in range(1,string_arr.size()-1):
		if csv_file[col][0] == base:
			print(" true ")
			dialog_arr.append(csv_file[col][1])
	dialog_container = dialog_arr

func _dialog(index:int)->void:
	dialog_box.text = dialog_container[index][1]

func check_text()->bool:
	if dialog_box != null and text_container != null:
		return true
	return false

func display_on_text()->void:
	if !check_text():
		print("RETURN NULL ON CHILDREN")
		return
	text_container.text = ""
	dialog_box.text = dialog_container[index][1]
	if Input.is_action_just_pressed("A-Button"):
		if index >= dialog_container.size() - 1:
			get_tree().paused = false
			return
		index+=1
		_dialog(index)
