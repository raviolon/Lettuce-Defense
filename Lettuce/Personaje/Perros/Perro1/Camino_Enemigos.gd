extends Node2D
var vida = 10

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_vida()
	print(vida)


func _on_enemigo_1_area_entered(area: Area2D) -> void:
	if area.is_in_group("proyectil"):
		vida -=1

func _vida():
	if vida <= 0:
		Global.cash += 100
		Global.enemigos_muertos += 1
		queue_free()
