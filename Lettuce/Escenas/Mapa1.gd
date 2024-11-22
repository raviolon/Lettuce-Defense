extends Node2D

var map_nodo
var construir_modo = false
var construir_valid = false
var contruir_ubicacion
var construir_tipo
var choclo = preload("res://Personaje/Choclo/choclo.tscn")
var tomate= preload("res://Personaje/Tomate/Tomate.tscn")
var morron= preload("res://Personaje/Morron/morron.tscn")
var naranja= preload("res://Personaje/Naranja/naranja.tscn")
var Perro = preload("res://Personaje/Perros/Perro1/Perro1.tscn")
var enemigos = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.cash = 200
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	

func _unhandled_input(event):
	pass
	
func iniciar_construc_mode(torre_tipo):
	pass
	

func enemigo1():
	var pos=$Mapa/Path2D
	var enemigo1=Perro.instantiate()
	print(enemigo1.get_node("Enemigo1").vida)
	enemigo1.global_position=Vector2(pos.global_position.x, pos.global_position.y)
	get_node("Mapa/Path2D").add_child(enemigo1)	

func _on_timer_timeout() -> void:	
	enemigo1()
	enemigos-=1
	if enemigos<=0:
		$"../Timer".stop()


func _on_button_pressed() -> void:
	get_tree().reload_current_scene()
	$Mapa/GAMEOVER/ColorRect.visible = false
	Global.vida = 10
	Global.cash = 100
	Global.nivel = 1
	pass # Replace with function body.

func _on_naranja_pressed():
	var instance = naranja.instantiate()
	add_child(instance)
	
	# Configura la posición inicial cerca del ratón
	instance.global_position = get_global_mouse_position()
	
	# Activa el modo de construcción si está disponible
	if instance.has_method("set_construccion"):
		instance.set_construccion(true)
	else:
		print("Advertencia: El nodo no tiene el método 'set_construccion'")
		
	pass # Replace with function body.


func _on_tomate_pressed() -> void:
	var instance = tomate.instantiate()
	add_child(instance)
	# Configura la posición inicial cerca del ratón
	instance.global_position = get_global_mouse_position()
	# Activa el modo de construcción si está disponible
	if instance.has_method("set_construccion"):
		instance.set_construccion(true)
	else:
		print("Advertencia: El nodo no tiene el método 'set_construccion'")
		
	pass # Replace with function body.


func _on_morron_pressed():
	var instance = morron.instantiate()
	add_child(instance)
	# Configura la posición inicial cerca del ratón
	instance.global_position = get_global_mouse_position()
	# Activa el modo de construcción si está disponible
	if instance.has_method("set_construccion"):
		instance.set_construccion(true)
	else:
		print("Advertencia: El nodo no tiene el método 'set_construccion'")
		
	pass # Replace with function body.


func _on_choclo_pressed():
	var instance = choclo.instantiate()
	add_child(instance)
	# Configura la posición inicial cerca del ratón
	instance.global_position = get_global_mouse_position()
	# Activa el modo de construcción si está disponible
	if instance.has_method("set_construccion"):
		instance.set_construccion(true)
	else:
		print("Advertencia: El nodo no tiene el método 'set_construccion'")
		
	pass # Replace with function body.
