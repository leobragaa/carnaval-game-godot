extends Node2D

@onready var player = $Player
@onready var game_over = $CanvasLayer2

func _ready() -> void:
	player.caracter_died.connect(game_over.mostrar)
