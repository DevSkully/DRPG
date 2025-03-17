class_name BgSound extends Resource

enum BACKGROUND_SOUND {
	Main_Menu,
	Dungeon_Crawler,
	Encounter_Monster,
	Encounter_Boss
}

@export var type:BACKGROUND_SOUND
@export var track:AudioStreamMP3
@export_range(-40,20) var volume = 0
@export_range(0.0, 4.0, 0.01) var pitch_scale = 1
