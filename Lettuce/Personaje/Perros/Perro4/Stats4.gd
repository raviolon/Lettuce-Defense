extends Node2D
var vida = 20

# Método para recibir daño de la bala
func receive_damage(damage: int) -> void:
	vida -= damage
	_vida()

func _on_enemigo_1_area_entered(area: Area2D) -> void:
	if area.is_in_group("proyectil"):
		vida -=1
		print(vida)

# Función para verificar si el enemigo ha muerto
func _vida():
	if vida <= 0:
		Global.cash += 100
		Global.enemigos_muertos += 1
		queue_free()  # Elimina al enemigo
