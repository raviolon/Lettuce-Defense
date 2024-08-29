extends Node2D

var municion = preload("res://Escenas/Balas.tscn")
var shoot = true
var target_position = null
var velocidad = 10

func _process(delta):
	_alert()
	if target_position and shoot:
		$Verdura.look_at(target_position)
		var b = municion.instantiate()
		b.global_position = global_position
		b.rotation = $Verdura.global_rotation 
		get_tree().current_scene.add_child(b)
		b.global_position = target_position
		target_position = null
		shoot = false  # Desactiva el disparo después de disparar

func _on_rango_area_entered(area):
	if shoot:
		if area.is_in_group("Enemigos"):
			target_position = area.global_position
			shoot = true

func _alert():
	if $Rango/CollisionShape2D.disabled:
		$Rango/CollisionShape2D.disabled = false
		shoot = true

func _on_detencion_timeout():
	$Rango/CollisionShape2D.disabled = true
	target_position = null
