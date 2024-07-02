extends CharacterBody2D

# Exportamos la velocidad para que pueda ser ajustada en el editor.
@export var SPEED: float = 300.0

# Obtenemos la gravedad desde la configuración del proyecto.
var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	# Obtenemos la dirección de entrada del usuario.
	var direction: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# Inicializamos la velocidad actual del cuerpo.
	var velocity: Vector2 = self.velocity

	
	# Movemos el personaje en función de la entrada.
	if direction != Vector2.ZERO:
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
	else:
		velocity.x = 0
		velocity.y = 0
	
	# Establecemos la nueva velocidad y movemos el personaje.
	self.velocity = velocity
	move_and_slide()
