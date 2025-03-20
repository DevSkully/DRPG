class_name selector extends Node2D

@export var arr_normal: Array[Texture]
@export var arr_hover : Array[Texture]
@export var Character : Array[Resource]

var arr_buttons:Array[TextureButton]

var currIndex:int = 0
var tween
func _ready() -> void:
	for button in get_children():
		if button is TextureButton:
			print("Found: ", button.name)
			arr_buttons.append(button)
	_select_Button(0)

func _select_Button(index:int)->void:
	var previous_button = arr_buttons[currIndex]
	var current_button = arr_buttons[currIndex + index]
	previous_button.set_texture_normal(arr_normal[currIndex])
	current_button.set_texture_normal(arr_hover[currIndex+index])
	currIndex += index

func on_press()->void:
	GameManager.set_Character(Character[currIndex].resource_path)
	AudioManager.create_audio(SoundEffectSettings.SOUND_EFFECT_TYPE.GAME_START)
	get_tree().change_scene_to_packed(GameManager._inst_World())

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Right"):
		_select_Button(1)
	if Input.is_action_just_pressed("Left"):
		_select_Button(-1)
	if Input.is_action_just_pressed("Start"):
		on_press()
