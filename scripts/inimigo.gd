
extends CharacterBody2D

@export var velocidade := 100.0
@export var dano := 10
@export var intervalo_ataque := 3.0

var jogador: Node2D
var pode_atacar := true

@onready var area_ataque: Area2D = $Area2D


func _ready() -> void:
	add_to_group("inimigos")
	jogador = get_tree().get_first_node_in_group("player")


func _physics_process(_delta: float) -> void:
	if jogador == null:
		return

	var direcao = global_position.direction_to(jogador.global_position)

	velocity = direcao * velocidade
	move_and_slide()

	if area_ataque.overlaps_body(jogador):
		atacar()


func atacar() -> void:
	if not pode_atacar:
		return

	if jogador.has_method("take_damage"):
		jogador.take_damage(dano)

		pode_atacar = false

		await get_tree().create_timer(intervalo_ataque).timeout

		pode_atacar = true
