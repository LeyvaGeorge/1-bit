class_name Player
extends PlatformerCharacter2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity.x = move_speed * direction.x
	_apply_gravity(delta)
	
	move_and_slide()
