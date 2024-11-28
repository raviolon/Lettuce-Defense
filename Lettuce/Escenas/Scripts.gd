extends Area2D

const DOWN = Vector2.DOWN

var velocidad: int = 0.25
var daño: int = 2 # El daño que hace la bala

func _ready():
	add_to_group("proyectil")  # Asegura que la bala está en el grupo 'proyectil'

func _physics_process(delta: float) -> void:
	var move = DOWN.rotated(rotation) * velocidad
	global_position += move

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemigos"):  # Verifica que la bala colisiona con un enemigo
		area.receive_damage(daño)  # Llama al método de recibir daño en el enemigo
		queue_free()  # Elimina la bala después de colisionar
