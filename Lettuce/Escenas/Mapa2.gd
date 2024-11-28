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

var Perro1 = preload("res://Personaje/Perros/Perro1/Perro1.tscn")
var Perro2 = preload("res://Personaje/Perros/Perro2/Perro2.tscn")
var Perro3 = preload("res://Personaje/Perros/Perro3/Perro3.tscn")
var Perro4 = preload("res://Personaje/Perros/Perro4/Perro4.tscn")
var Perro5 = preload("res://Personaje/Perros/Perro5/Perro5.tscn")

var enemigos_cantidad = {
	"enemigos1": 5,
	"enemigos2": 2,
	"enemigos3": 1,
	"enemigos4": 1,
	"enemigos5": 1
}

var enemigos = {
	"enemigos1": 5,
	"enemigos2": 2,
	"enemigos3": 1,
	"enemigos4": 1,
	"enemigos5": 1
}

var ronda = 1

func _ready():
	Global.vida = 10
	Global.enemigos_muertos = 0
	Global.cash = 200
	map_nodo = $Mapa

func game_win():
		if ronda > 2:
			var color_rect_sprite = get_tree().root.get_node("Juego/Mapa2/Mapa/GAMEWIN")
			color_rect_sprite.visible = true
			for i in range(1, 6):  # Para todos los temporizadores
				var timer = get_node("../Timer_Perro" + str(i))
				timer.stop()

func enemigo1():
	var pos = $Mapa/Path2D
	var Perro1_1 = Perro1.instantiate()
	Perro1_1.global_position = pos.global_position
	get_node("Mapa/Path2D").add_child(Perro1_1)

func enemigo2():
	var pos = $Mapa/Path2D
	var Perro2_1 = Perro2.instantiate()
	Perro2_1.global_position = pos.global_position
	get_node("Mapa/Path2D").add_child(Perro2_1)

func enemigo3():
	var pos = $Mapa/Path2D
	var Perro3_1 = Perro3.instantiate()
	Perro3_1.global_position = pos.global_position
	get_node("Mapa/Path2D").add_child(Perro3_1)

func enemigo4():
	var pos = $Mapa/Path2D
	var Perro4_1 = Perro4.instantiate()
	Perro4_1.global_position = pos.global_position
	get_node("Mapa/Path2D").add_child(Perro4_1)

func enemigo5():
	var pos = $Mapa/Path2D
	var Perro5_1 = Perro5.instantiate()
	Perro5_1.global_position = pos.global_position
	get_node("Mapa/Path2D").add_child(Perro5_1)

func _on_button_lose_pressed() -> void:
	get_tree().reload_current_scene()
	$Mapa/GAMEOVER/ColorRect.visible = false
	Global.vida = 10
	Global.cash = 100
	Global.nivel = 1

func _process(delta):
	Global.ronda = ronda
	if construir_modo and torre_instancia_temp != null:
		var mouse_pos = get_global_mouse_position()
		torre_instancia_temp.global_position = mouse_pos  
		if torre_instancia_temp.get_node("construc").get_overlapping_bodies().size() > 1:
			torre_instancia_temp.modulate = Color(1, 0, 0, 0.5)  
		else:
			torre_instancia_temp.modulate = Color(1, 1, 1, 0.5)

func _input(event):
	if construir_modo and event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		colocar_torre_definitiva()

func colocar_torre_definitiva():
	if torre_seleccionada == null or torre_instancia_temp == null:
		return
	if torre_instancia_temp.get_node("construc").get_overlapping_bodies().size() > 1:
		print("No se puede colocar aquí. El área está ocupada.")
		return
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

func _on_timer_perro_1_timeout() -> void:
	enemigo1()
	enemigos["enemigos1"] -= 1
	if enemigos["enemigos1"] <= 0:
		$"../Timer_Perro1".stop()
		resetear_enemigos_y_pasar_ronda()
	else:
		$"../Timer_Perro1".start()

func _on_timer_perro_2_timeout() -> void:
	enemigo2()
	enemigos["enemigos2"] -= 1
	if enemigos["enemigos2"] <= 0:
		$"../Timer_Perro2".stop()
		resetear_enemigos_y_pasar_ronda()
	else:
		$"../Timer_Perro2".start()

func _on_timer_perro_3_timeout() -> void:
	enemigo3()
	enemigos["enemigos3"] -= 1
	if enemigos["enemigos3"] <= 0:
		$"../Timer_Perro3".stop()
		resetear_enemigos_y_pasar_ronda()
	else:
		$"../Timer_Perro3".start()

func _on_timer_perro_4_timeout() -> void:
	enemigo4()
	enemigos["enemigos4"] -= 1
	if enemigos["enemigos4"] <= 0:
		$"../Timer_Perro4".stop()
		resetear_enemigos_y_pasar_ronda()
	else:
		$"../Timer_Perro4".start()

func _on_timer_perro_5_timeout() -> void:
	enemigo5()
	enemigos["enemigos5"] -= 1
	if enemigos["enemigos5"] <= 0:
		$"../Timer_Perro5".stop()
		resetear_enemigos_y_pasar_ronda()
	else:
		$"../Timer_Perro5".start()

func todos_enemigos_derrotados() -> bool:
	for cantidad in enemigos.values():
		if cantidad > 0:
			game_win()
			return false
	return true

func resetear_enemigos_y_pasar_ronda():
	if todos_enemigos_derrotados():
		if ronda < 3:
			ronda += 1
			calcular_nuevos_valores()
			print("Inicia la ronda:", ronda)
			reiniciar_timers()  
	else:
		print("Aún quedan enemigos por derrotar.")

func reiniciar_timers():
	for i in range(1, 6):
		var timer = get_node_or_null("../Timer_Perro" + str(i))
		if timer:
			timer.stop()

	for clave in enemigos.keys():
		if enemigos[clave] > 0:
			var timer = safe_get_node("../Timer_Perro" + str(clave[-1])) 
			if timer:
				timer.start()

func safe_get_node(path: String) -> Node:
	if has_node(path):
		return get_node(path)
	return null

func calcular_nuevos_valores():
	for clave in enemigos.keys():
		enemigos[clave] = enemigos_cantidad[clave] * ronda
