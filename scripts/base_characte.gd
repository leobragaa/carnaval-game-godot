extends CharacterBody2D

class_name BaseCharacter

@export_category("Variables")
@export var _move_speed: float = 128.0

@export_category("Objects")
@export var _sprite2D:  Sprite2D
@export var _animation: AnimationPlayer

var _direction: Vector2 = Vector2.ZERO

func _process(_delta: float) -> void:
	pass
	
func _physics_process(_delta: float) -> void:
	_move()
	_animate()

func _move() -> void:
	_direction = Input.get_vector("left", "right","top", "down")
	velocity = _direction * _move_speed
	move_and_slide()
	
func _animate() -> void:
	
	if _direction == Vector2.ZERO:
		_animation.play("idle_front")
		return
		
	if abs(_direction.x) > abs(_direction.y):
		
		if _direction.x > 0:
			_sprite2D.flip_h = false
			_animation.play("run_lado")
			
		elif _direction.x < 0:
			_sprite2D.flip_h = 	 true	
			_animation.play("run_lado")
			
	else:
		if _direction.y > 0:
			_animation.play("run_front")
		else:
			_animation.play("run_up")
			


func _on_animation_player_on_animation_finished(_anim_name: StringName) -> void:
	pass # Replace with function body.
