extends CanvasLayer

# Variable para controlar el estado de la visibilidad del ColorRect
var presionado = false
var color_rect

func _ready():
	# Inicializamos el nodo ColorRect
	color_rect = get_node("ColorRect")
	color_rect.visible = false  # Al principio el ColorRect no es visible

func _process(delta: float) -> void:
	# Detectamos la tecla de pausa
	if Input.is_action_just_pressed("Pausa"):
		if color_rect.visible:  # Si el ColorRect está visible, lo ocultamos y reanudamos el juego
			color_rect.visible = false
			get_tree().paused = false  # Reanudar el juego
		else:  # Si el ColorRect no está visible, lo mostramos y pausamos el juego
			color_rect.visible = true
			get_tree().paused = true  # Pausar el juego
		presionado = true  # Aseguramos que no se vuelva a alternar hasta la siguiente pulsación


func _on_button_pressed() -> void:
	# Detener procesos específicos de la escena actual si es necesario
	# Por ejemplo, si tienes un temporizador, lo puedes detener aquí:
	# $Timer.stop()

	# Cambiar a la nueva escena (por ejemplo, al menú principal)
	get_tree().change_scene_to_file("res://Escenas/Menu.tscn")
