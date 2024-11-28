extends Area2D

const DOWN = Vector2.DOWN

var velocidad: int = 0.25
var daño: int = 2 

func _ready():
	add_to_group("proyectil")  

func _physics_process(delta: float) -> void:
	var move = DOWN.rotated(rotation) * velocidad
	global_position += move

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemigos"): 
		area.receive_damage(daño) 
		queue_free() 
