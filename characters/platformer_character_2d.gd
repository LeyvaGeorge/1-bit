class_name PlatformerCharacter2D
extends CharacterBody2D

signal direction_changed(direction: Vector2)

## Player's movement speed
@export_range(0,150,5,"or_greater") var move_speed : float = 120.0
@export var can_ground_jump : bool = true
@export_range(0,400,5,"or_greater") var jump_force : float = 350.0


#changes the player's facing when a change is different
var direction : Vector2 :
	set(value):
		if direction == value:
			return
		
		direction = value
		direction_changed.emit(direction)

func _apply_gravity(delta):
	var gravity = get_gravity()
	velocity.x += gravity.x * delta
	velocity.y += gravity.y * delta

## Makes the character jump if possible
##
##Return true if jump is  successful or false if failed
func try_jump()->bool:
	if can_ground_jump && is_on_floor():
		_jump()
		return true
	return false


## Execute a ground jump
func _jump():
	velocity.y -= jump_force
