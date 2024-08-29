extends Area2D

const RIGHT = Vector2.RIGHT
var velocidad: int = 5

func _physics_process(delta: float) -> void:
	var move = RIGHT.rotated(rotation) * velocidad
	global_position += move


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemigos"):
		print("pow")

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
