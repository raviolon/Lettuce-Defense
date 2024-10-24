extends Node2D

var map_nodo
var construir_modo = false
var construir_valid = false
var contruir_ubicacion
var construir_tipo
var choclo = preload("res://Personaje/Tomate/Tomate.tscn")
var Perro = preload("res://Personaje/Perros/Perro1/Perro1.tscn")
var enemigos = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	

func _unhandled_input(event):
	pass
	
func iniciar_construc_mode(torre_tipo):
	pass

func _on_choclo_pressed() -> void:
	
	var instance = choclo.instantiate()  # Cambiado a instantiate()
	add_child(instance)
	pass # Replace with function body.

func enemigo1():
	var pos=$Mapa/Path2D
	var enemigo1=Perro.instantiate()
	enemigo1.global_position=Vector2(pos.global_position.x, pos.global_position.y)
	get_node("Mapa/Path2D").add_child(enemigo1)

func _on_timer_timeout() -> void:	
	enemigo1()
	enemigos-=1
	if enemigos<=0:
		$"../Timer".stop()

func _game_over():
	if Global.vida <= 0:
		$Mapa/GAMEOVER/ColorRect.visible = true

func _on_area_2d_area_entered(area: Area2D) -> void:
	if  area.is_in_group("Enemigos"):
		Global.vida -= 1
		_game_over()


func _on_button_pressed() -> void:
	get_tree().reload_current_scene()
	$Mapa/GAMEOVER/ColorRect.visible = false
	Global.vida = 10
	Global.cash = 100
	Global.nivel = 1
	pass # Replace with function body.
