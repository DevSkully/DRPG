class_name Item extends Node

@export var item_name:String : set=set_item_name
func set_item_name(new_value:String)->void:
	item_name = new_value
@export var icon:Texture2D : set=set_image
func set_image(new_value:Texture2D)->void:
	icon = new_value
var count:int : set=set_item_count
func set_item_count(new_value:int)->void:
	count=new_value
func add_count()->void:
	count+=1
var font:Font=load("res://Assets/FONTS/nintendo-nes-font.ttf")

func _init(val_name:String, val_icon:Texture2D) -> void:
	item_name = val_name
	icon = val_icon

func _to_string() -> String:
	return item_name + ' - ' + str(count)
