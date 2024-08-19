class_name ObjectStats
extends Resource
## Statistics about an object

signal death()

@export var max_health : int = 100
@export var current_health : int =100 :
	set(value):
		var old = current_health
		current_health = value
		
		if old > 0 && current_health <=0:
			death.emit()

func _init() -> void:
	if not resource_local_to_scene:
		push_warning("Resource not local to scene %s" % resource_path)
