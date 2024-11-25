extends Node2D

var map_nodo
var construir_modo = false
var torre_seleccionada: PackedScene = null
var torre_instancia_temp = null  
var torre_instancia_final = null  
var choclo = preload("res://Personaje/Choclo/choclo.tscn")
var tomate = preload("res://Personaje/Tomate/Tomate.tscn")
var morron = preload("res://Personaje/Morron/morron.tscn")
var naranja = preload("res://Personaje/Naranja/naranja.tscn")
var Perro = preload("res://Personaje/Perros/Perro1/Perro1.tscn")
var enemigos = 3
var enemigos_total = enemigos

func _ready():
	Global.enemigos_muertos = 0
	Global.cash = 200
	map_nodo = $Mapa

func game_win():
	# Verifica si todos los enemigos han muerto y si el juego no ha sido ganado aún
	if enemigos_total == Global.enemigos_muertos :
		var color_rect_sprite = get_tree().root.get_node("Juego/Mapa1/Mapa/GAMEWIN")
		color_rect_sprite.visible = true

func enemigo1():
	var pos = $Mapa/Path2D
	var enemigo1 = Perro.instantiate()
	print(enemigo1.get_node("Enemigo1").vida)
	enemigo1.global_position = Vector2(pos.global_position.x, pos.global_position.y)
	get_node("Mapa/Path2D").add_child(enemigo1)

func _on_timer_timeout() -> void:
	enemigo1()
	enemigos -= 1
	if enemigos <= 0:
		$"../Timer".stop()

func _on_button_lose_pressed() -> void:
	get_tree().reload_current_scene()
	$Mapa/GAMEOVER/ColorRect.visible = false
	Global.vida = 10
	Global.cash = 100
	Global.nivel = 1

func _process(delta):
	if construir_modo and torre_instancia_temp != null:
		var mouse_pos = get_global_mouse_position()
		torre_instancia_temp.global_position = mouse_pos  

		# Validar colisión para cambiar el color
		if torre_instancia_temp.get_node("construc").get_overlapping_bodies().size() > 1:
			torre_instancia_temp.modulate = Color(1, 0, 0, 0.5)  # Rojo si hay colisión
		else:
			torre_instancia_temp.modulate = Color(1, 1, 1, 0.5)  # Blanco si está libre

	# Llama a game_win() para verificar si el juego ha sido ganado
	game_win()

func _input(event):
	if construir_modo and event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		colocar_torre_definitiva()

func colocar_torre_definitiva():
	if torre_seleccionada == null or torre_instancia_temp == null:
		return

	# Validar colisión antes de colocar la torre
	if torre_instancia_temp.get_node("construc").get_overlapping_bodies().size() > 1:
		print("No se puede colocar aquí. El área está ocupada.")
		return

	# Colocar torre definitiva
	torre_instancia_temp.queue_free()
	torre_instancia_temp = null

	var mouse_pos = get_global_mouse_position()
	torre_instancia_final = torre_seleccionada.instantiate()
	torre_instancia_final.global_position = mouse_pos
	torre_instancia_final.set_construccion(false)
	$Mapa/torres.add_child(torre_instancia_final)

	construir_modo = false
	print("Torre colocada en:", mouse_pos)

func _on_naranja_pressed():
	crear_torre_temporal(naranja, 150)

func _on_tomate_pressed():
	crear_torre_temporal(tomate, 50)

func _on_morron_pressed():
	crear_torre_temporal(morron, 150)

func _on_choclo_pressed():
	crear_torre_temporal(choclo, 100)

func crear_torre_temporal(preload_scene: PackedScene, costo: int):
	if Global.cash >= costo:
		Global.cash -= costo
		construir_modo = true
		torre_seleccionada = preload_scene
		if torre_instancia_temp != null:
			torre_instancia_temp.queue_free()
		torre_instancia_temp = torre_seleccionada.instantiate()
		torre_instancia_temp.modulate = Color(1, 1, 1, 0.5)  
		torre_instancia_temp.scale = Vector2(1, 1)
		torre_instancia_temp.set_construccion(true)
		$Mapa/torres.add_child(torre_instancia_temp)  
		print("Vista previa activada para:", preload_scene)
	else:
		print("Dinero insuficiente")

func _on_button_win_pressed():
	get_tree().change_scene_to_file("res://Escenas/Menu.tscn")
