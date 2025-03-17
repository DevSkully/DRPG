class_name BgMusic extends Resource

enum BACKGROUND_MUSIC {
	Main_Menu,
	Dungeon_Crawler,
	Encounter_Monster,
	Encounter_Boss
}

@export var type:BACKGROUND_MUSIC
@export var track:AudioStreamMP3
@export_range(-40,20) var volume = 0
@export_range(0.0, 4.0, 0.01) var pitch_scale = 1
