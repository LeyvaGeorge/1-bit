class_name PlatformerCharacter2D
extends CharacterBody2D

signal direction_changed(direction: Vector2)

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
