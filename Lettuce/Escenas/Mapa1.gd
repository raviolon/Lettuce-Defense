extends Node2D

var map_nodo
var construir_modo = false
var construir_valid = false
var contruir_ubicacion
var construir_tipo
var choclo = preload("res://Personaje/Choclo/choclo.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _unhandled_input(event):
	pass
	
func iniciar_construc_mode(torre_tipo):
	pass

func _on_choclo_pressed() -> void:
	var instance = choclo.instantiate()  # Cambiado a instantiate()
	add_child(instance)
	pass # Replace with function body.
