extends Area2D

func _on_area_entered(area: Area2D) -> void:
	if  area.is_in_group("Enemigos"):
		Global.vida -= 1
		_game_over()
	
func _game_over():
	if Global.vida <= 0:
		$Mapa/GAMEOVER/ColorRect.visible = true
