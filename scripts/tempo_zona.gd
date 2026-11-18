extends Node

@onready var label = $Label
@onready var timer = $Timer
@onready var zona_segura = $"../../Area2D"

func _ready() -> void:
	label.set_anchors_preset(Control.PRESET_TOP_LEFT)
	label.position = Vector2(20, 20)
	
	timer.wait_time = 60
	timer.one_shot = true
	timer.stop()

	zona_segura.body_entered.connect(_entrou)
	zona_segura.body_exited.connect(_saiu)

	label.text = "01:00"


func _entrou(body: Node2D) -> void:
	if body.is_in_group("player"):
		if timer.is_stopped():
			timer.start()
		else:
			timer.paused = false


func _saiu(body: Node2D) -> void:
	if body.is_in_group("player"):
		timer.paused = true


func time_count():
	var time_left = ceil(timer.time_left)
	var minute = int(time_left / 60)
	var second = int(time_left) % 60

	return [minute, second]


func _process(_delta: float) -> void:
	label.text = "%02d:%02d" % time_count()


func _on_timer_timeout() -> void:
	print("VENCEU !!!")
