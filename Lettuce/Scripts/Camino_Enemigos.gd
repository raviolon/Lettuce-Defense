extends Node2D
@onready var path_follow : PathFollow2D = $Path2D/PathFollow2D
@export var speed = 100
var vida = 10

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	path_follow.progress += delta * speed	
	_vida()


func _on_enemigo_1_area_entered(area: Area2D) -> void:
	if area.is_in_group("proyectil"):
		vida -=1

func _vida():
	if vida <= 0:
		queue_free()
