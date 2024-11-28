extends Node2D
var vida = 15

func receive_damage(damage: int) -> void:
	vida -= damage
	_vida()

func _on_enemigo_1_area_entered(area: Area2D) -> void:
	if area.is_in_group("proyectil"):
		vida -=1
		print(vida)

func _vida():
	if vida <= 0:
		Global.cash += 100
		Global.enemigos_muertos += 1
		queue_free()  
