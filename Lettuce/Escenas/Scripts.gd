extends Area2D

const DOWN = Vector2.DOWN
var velocidad: int = 10

func _physics_process(delta: float) -> void:
	var move = DOWN.rotated(rotation) * velocidad
	global_position += move


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemigos"):
		print("pow")
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
