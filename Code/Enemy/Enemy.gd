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

func player_collision(area:Area3D)->void:
	print("Collision with Player: ", area.name)
