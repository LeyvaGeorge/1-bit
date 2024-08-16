class_name Player
extends PlatformerCharacter2D

## Player's movement speed
@export_range(0,100,1,"or_greater") var move_speed : float = 50.0
## Player's input button action
@export var actions : Player_Input_Actions

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	direction = Input.get_vector(actions.left, actions.right, actions.up, actions.down)
	
	velocity.x = move_speed * direction.x
	
	move_and_slide()
