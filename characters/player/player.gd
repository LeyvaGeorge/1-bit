class_name Player
extends PlatformerCharacter2D

## Player's movement speed
@export_range(0,150,5,"or_greater") var move_speed : float = 120.0
@export_range(0,400,5,"or_greater") var jump_force : float = 350.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity.x = move_speed * direction.x
	_apply_gravity(delta)
	
	move_and_slide()

## Makes the character jump if possible
##
##Return true if jump is  successful or false if failed
func try_jump()->bool:
	if is_on_floor():
		_jump()
		return true
	return false


## Execute a ground jump
func _jump():
	velocity.y -= jump_force
