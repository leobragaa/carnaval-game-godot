extends Camera2D

var target: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_target()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position = target.global_position
	

func get_target():
	var nodes = get_tree().get_nodes_in_group("BaseCharacter")
	if nodes.size() == 0:
		push_error("Player not found")
		return
	target = nodes[0]
