class_name Hitbox2D
extends Area2D
## Area where on enter, can do damage to the object of a hurtbox

signal hit(target: HurtBox2D, amount : int)

@export var weapon_stats : WeaponStats

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	

func _on_area_entered(p_area: Area2D):
	var hurtbox = p_area as HurtBox2D
	
	if not hurtbox || not hurtbox.get_hittable():
		return
		
	var damage_dealt = weapon_stats.damage
	hurtbox.stats.current_health -= damage_dealt
	hit.emit(hurtbox,damage_dealt)
