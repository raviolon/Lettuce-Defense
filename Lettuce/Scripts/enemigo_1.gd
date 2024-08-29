extends Area2D

var vida = 2

func _process(_delta):
	_vida()

func _on_enemigo_1_area_entered(area: Area2D) -> void:
	if area.is_in_group("proyectil"):
		vida -=1

func _vida():
	pass
