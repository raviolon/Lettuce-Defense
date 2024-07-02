extends Node2D

func giro():
	var enemy_position = get_global_mouse_position()
	get_node("Verdura").look_at(enemy_position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	giro()
