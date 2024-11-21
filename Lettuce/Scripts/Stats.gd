extends Node2D
var vida = 10

func _on_enemigo_1_area_entered(area: Area2D) -> void:
	if area.is_in_group("proyectil"):
		vida -=1
		print("vida")

func _vida():
	if vida <= 0:
		Global.cash += 100
		queue_free()
