extends Node2D
var vida = 10

# Método para recibir daño de la bala
func receive_damage(damage: int) -> void:
	vida -= damage
	print("Vida del enemigo:", vida)  # Depuración: Verifica que la vida se reduce
	_vida()

func _on_enemigo_1_area_entered(area: Area2D) -> void:
	if area.is_in_group("proyectil"):
		vida -=1
		print("vida")

# Función para verificar si el enemigo ha muerto
func _vida():
	if vida <= 0:
		Global.cash += 100
		queue_free()  # Elimina al enemigo
