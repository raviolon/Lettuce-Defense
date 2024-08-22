extends Node2D

var shoot = true
var target_position = null

func _process(delta):
	_alert()
	if target_position:
		$Verdura.look_at(target_position)
   
func _on_rango_area_entered(area):
	if shoot:
		if area.is_in_group("Enemigos"):
			target_position = area.global_position  # Guarda la posición del enemigo

func _alert():
	if $Rango/CollisionShape2D.disabled:
		$Rango/CollisionShape2D.disabled = false
		shoot = true  # Cambiado '==' a '=' para asignar el valor

func _on_detencion_timeout():
	$Rango/CollisionShape2D.disabled = true
	target_position = null  # Opcional: Resetea la posición objetivo si es necesario
