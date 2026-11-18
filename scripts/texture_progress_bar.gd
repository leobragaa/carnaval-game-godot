extends TextureProgressBar

@export var player: BaseCharacter


func _ready() -> void:
	player = get_tree().get_first_node_in_group("player") as BaseCharacter
	player.health_changed.connect(update)
	
	max_value = player.max_health
	value = player.health
	
	update()

func update(_current_health: int = 0, _max_health: int = 0) -> void:
	value = (float(player.health) / player.max_health) * 100
