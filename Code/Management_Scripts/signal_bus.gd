class_name Signal_Bus extends Node

signal on_player_action_update(int)

var player_graphic_user_interface : set = set_gui
func set_gui(new_value:Action_Picker)->void:
	player_graphic_user_interface = new_value

func movement_update(value:int)->void:
	self.on_player_action_update.emit(value)

func movement_disconnect()->void:
	self.on_player_action_update.disconnect(update_emit)

func update_emit(value:int)->void:
	player_graphic_user_interface.texture_button_modulate(player_graphic_user_interface.Base_Controls_children[value])
