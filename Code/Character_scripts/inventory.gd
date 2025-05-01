class_name Inventory extends Control

signal get_item(Callable)

@onready var arr:Array[Item]
@onready var item_list:ItemList = $ItemList

func _ready() -> void:
	show_item()

## CHECK FOR DUPLICANT
func check(item:Item)->bool:
	for x in arr:
		if x.item_name == item.item_name:
			x.add_count()
			return true
	return false
## ITEM ADDING IN THE ARRAY
func add_item(item:Item)->void:
	if arr.size() <= 0:
		item.add_count()
		arr.append(item)
	if !check(item):
		item.add_count()
		arr.append(item)
## SHOW ARRAY:VARIANT = ITEM_LIST
func show_item()->void:
	for item in arr:
		item_list.add_item(item.to_string(),item.icon)
