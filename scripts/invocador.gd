extends Node2D

@export var cena_inimigo: PackedScene
@export var limite_inimigos := 5

@export var largura_mapa := 2000.0
@export var altura_mapa := 1200.0

@onready var timer: Timer = $Timer


func _ready() -> void:
	timer.timeout.connect(invocar_inimigo)


func invocar_inimigo() -> void:
	var inimigos = get_tree().get_nodes_in_group("inimigos")

	if inimigos.size() >= limite_inimigos:
		return

	var inimigo = cena_inimigo.instantiate()

	get_parent().add_child(inimigo)

	inimigo.global_position = Vector2(
		randf_range(0, largura_mapa),
		randf_range(0, altura_mapa)
	)
