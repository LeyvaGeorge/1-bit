class_name HurtBox2D

extends Area2D
## Where an object can take damage

##Stats of the active object that damage can be dealt to on hit
@export var stats : ObjectStats

func get_hittable() -> bool:
	return stats.current_health > 0
