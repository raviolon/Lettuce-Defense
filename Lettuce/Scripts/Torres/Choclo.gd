extends Node2D

var municion = preload("res://Escenas/Balas.tscn")
var shoot = true
var target_position = null
var velocidad = 10
var construccion = false
var offset = Vector2.ZERO  # Para manejar el arrastre correctamente

func _ready():
	connect("input_event", Callable(self, "_on_construc_input_event"))

func _process(_delta):
	_alert()
	
	# Si está en modo construcción, sigue el ratón
	if construccion:
		self.global_position = get_global_mouse_position() - offset
		shoot = false
	
	# Manejo del disparo
	elif target_position and shoot:
		$Verdura.look_at(target_position)
		var b = municion.instantiate()
		b.global_position = global_position
		b.rotation = $Verdura.global_rotation
		get_tree().current_scene.add_child(b)
		b.global_position = target_position
		target_position = null
		shoot = false

func _on_construc_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
			construccion = true
			offset = get_global_mouse_position() - global_position  # Calcula el desplazamiento inicial
			$".".modulate = Color("7a7a7a")
		elif event.is_released() and event.button_index == MOUSE_BUTTON_LEFT:
			construccion = false
			$".".modulate = Color("ffffff")

func _on_rango_area_entered(area):
	if shoot and area.is_in_group("Enemigos"):
		target_position = area.global_position
		shoot = true

func _alert():
	if $Rango/CollisionShape2D.disabled:
		$Rango/CollisionShape2D.disabled = false
		shoot = true

func _on_detencion_timeout():
	$Rango/CollisionShape2D.disabled = true
	target_position = null

func set_construccion(state: bool) -> void:
	if(Global.cash >= 100):
		Global.cash -= 100
		construccion = state
		if construccion:
			offset = get_global_mouse_position() - global_position

#func _on_construc_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
#		if event is InputEventMouseButton:
#			if event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
#				construccion = true
#				print(1)
#				$".".modulate = Color("7a7a7a")
#			if event.is_released() and event.button_index == MOUSE_BUTTON_LEFT:
#				construccion = false
#				$".".modulate = Color("ffffff")
#				pass

#func _on_construct_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
			#if event is InputEventMouseButton:
				#if event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
					#construccion = true
					#print(1)
				#$".".modulate = Color("7a7a7a")
				#if event.is_released() and event.button_index == MOUSE_BUTTON_LEFT:
					#construccion = false
					#$".".modulate = Color("ffffff")
					#pass # Replace with function body.
