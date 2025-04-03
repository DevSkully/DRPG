class_name Enemy extends Stat

## -- SIGNAL -- ##
signal On_Action
signal Face_Direction
## -- VARIABLES -- ##
@export var EnemySprite:Texture : set=setEnemySprite
func setEnemySprite(new_value)->void:
	EnemySprite = new_value
## -- FUNCTIONS -- ##
func _ready() -> void:
	pass
func Get_Player()->void:
	# Connect Room when Player is finally / enter in Room
	# Get Player Position if in room
	# Automatically Face Character
	pass
func Face_Player()->void:
	# Get Player Position And Redo Direction of self, asymetrical to player
	# based / manipulate only z-axis
	pass
func On_Move()->void:
	# MOVE TOWARDS PLAYER IF PLAYER IS DETECTED OF AREA2D
	# CHECK IF PLAYER IS IN ROOM
	pass
func On_Turn_Action()->void:
	# CHECK IF STATE = IN_COMBAT
	# DO A SINGLE ACTION
	# CHANGE ENEMY_BASED U.I. IF SO ANY CHANGES WERE MADE
	pass
func On_Player_Encounter()->void:
	# SHOW SELF G.U.I.
	pass
