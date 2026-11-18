extends Line2D

@export var raio := 100.0
@export var quantidade_pontos := 100

func _ready() -> void:
	width = 4
	default_color = Color.GREEN

	for i in range(quantidade_pontos):
		var angulo = TAU * i / quantidade_pontos

		var x = cos(angulo) * raio
		var y = sin(angulo) * raio

		add_point(Vector2(x, y))

	add_point(points[0])
