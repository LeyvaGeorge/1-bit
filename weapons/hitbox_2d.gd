class_name Hitbox2D
extends Area2D
## Area where on enter, can do damage to the object of a hurtbox

@export var weapon_stats : WeaponStats

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	

func _on_area_entered(p_area: Area2D):
	var hurtbox = p_area as HurtBox2D
	
	if not hurtbox:
		return
		
	hurtbox.stats.current_health -= weapon_stats.damage
	prints(hurtbox.stats.current_health)
