extends CharacterBody2D

class_name BaseCharacter

signal health_changed(curret_health: int, max_health: int)
signal caracter_died

@export_category("Variables")
@export var _move_speed: float = 128.0

@export_category("Objects")
@export var _sprite2D:  Sprite2D
@export var _animation: AnimationPlayer

@export var max_health = 100
@export var _tempo_invulnerabilidade: float = 1.0
var _is_dead: bool = false
var _tempo_invunerabilidade: float = 0.0

var health: int = 5
var _idle_direction: String = "idle_front"
var _direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	add_to_group("player")

	health = max_health
	health_changed.emit(health, max_health)

func _physics_process(_delta: float) -> void:
	_move()
	_animate()

func _move() -> void:
	_direction = Input.get_vector("left", "right","top", "down")
	velocity = _direction * _move_speed
	move_and_slide()
	
func _animate() -> void:
	
	if _animation == null:
		return

	if _direction == Vector2.ZERO:
		_animation.play(_idle_direction)
		return
		
	if abs(_direction.x) > abs(_direction.y):
		
		if _direction.x > 0:
			_idle_direction = "idle_right"
			_sprite2D.flip_h = false
			_animation.play("run_right")
			
		else:
			_idle_direction = "idle_left"
			_sprite2D.flip_h = 	 false	
			_animation.play("run_left")
	else:
		if _direction.y > 0:
			_animation.play("run_front")
			_idle_direction = "idle_front"
		else:
			_animation.play("run_up")
			_idle_direction = "idle_up"

func take_damage(amount: int) -> void:
	if _is_dead:
		return
	if _tempo_invunerabilidade > 0:
		return
	
	health -= amount
	health = clampi(health, 0, max_health)
	
	_tempo_invunerabilidade = _tempo_invunerabilidade 
	healthChanged()

func morte() -> void:
	if _is_dead:
		return
	_is_dead = true
	velocity = Vector2.ZERO
	caracter_died.emit()

func healthChanged():
	health_changed.emit(health, max_health)
	
func _on_animation_player_on_animation_finished(_anim_name: StringName) -> void:
	pass
