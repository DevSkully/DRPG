class_name Inventory extends Control

@onready var arr:Array[Item]
@onready var item_list:ItemList = $ItemList

func _ready() -> void:
	for list in range(5):
		var new_item = ItemManager.get_random_item()
		#TODO: check if item is existing in the array ???
		if arr.size()<=0:
			new_item.add_count()
			arr.append(new_item)
		else:
			
			print('item:',new_item.item_name,' - copy:',check_item(new_item))
			arr.append(new_item)
	
	show_item()

func check_item(item:Item)->bool:
	return true if arr.bsearch(item.item_name)==0 else false

func add_item(item:Item)->void:
	pass

func show_item()->void:
	for item in arr:
		item_list.add_item(item.to_string(),item.icon)
