class_name Shooter
extends RayCast2D
## Lauches projectiles when try_shoot is called successfully

@export var fireable : Fireable
@export var group_names: GroupNames
@export var default_direction = Vector2.RIGHT

var projectiles_parent : Node

func _ready() -> void:
	projectiles_parent = get_tree().get_first_node_in_group(group_names.projectiles_parent_group)
	assert(projectiles_parent != null, "Projectiles node is required for this script to work.")

func try_shoot() -> bool:
	if not is_colliding():
		_shoot()
		return true
	
	return false



func _shoot():
	var projectile = fireable.scene.instantiate() as Projectile
	projectiles_parent.add_child(projectile)
	projectile.global_position = global_position
	var launch_direction = default_direction.rotated(global_rotation)
	projectile.launch(launch_direction)
