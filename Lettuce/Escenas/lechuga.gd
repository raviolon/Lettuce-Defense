extends Area2D

func _on_area_entered(area: Area2D) -> void:
	if  area.is_in_group("Enemigos"):
		Global.vida -= 1
		_game_over()
	
func _game_over():
	if Global.vida <= 9:
		var color_rect_sprite = get_tree().root.get_node("Juego/Mapa1/Mapa/GAMEOVER/ColorRect")
		color_rect_sprite.visible = true
