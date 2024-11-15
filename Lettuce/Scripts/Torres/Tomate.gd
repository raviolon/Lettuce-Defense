extends Node2D

var municion = preload("res://Escenas/Balas.tscn")
var shoot = true
var target_position = null
var velocidad = 10
var construccion = false
var offset = Vector2.ZERO  # Declaramos offset como una variable global del nodo

func _ready():
	connect("input_event", Callable(self, "_on_construc_input_event"))

func _process(_delta):
	if construccion:
		# Actualiza la posición del nodo durante la construcción
		self.global_position = get_global_mouse_position() - offset
		shoot = false
	
	elif target_position and shoot:
		$Verdura.look_at(target_position)
		var b = municion.instantiate()
		b.global_position = global_position
		b.rotation = $Verdura.global_rotation
		get_tree().current_scene.add_child(b)
		b.global_position = target_position
		target_position = null
		shoot = false

func set_construccion(state: bool) -> void:
	# Método para inicializar el modo de construcción
	construccion = state
	if construccion:
		offset = get_global_mouse_position() - global_position

#func _on_construc_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
#	if event is InputEventMouseButton:
#		if event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
#			construccion = true
#			offset = get_global_mouse_position() - global_position  # Calcula el offset
#			$".".modulate = Color("7a7a7a")
#		elif event.is_released() and event.button_index == MOUSE_BUTTON_LEFT:
#			construccion = false
#			$".".modulate = Color("ffffff")
