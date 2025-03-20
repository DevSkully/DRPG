extends Node2D

func _on_pressed() -> void:
	AudioManager.create_audio(SoundEffectSettings.SOUND_EFFECT_TYPE.GAME_START)
	get_tree().change_scene_to_packed(GameManager._inst_World())
