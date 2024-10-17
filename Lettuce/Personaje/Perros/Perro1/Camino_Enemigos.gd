extends PathFollow2D
@export var speed = 100
var vida = 10

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress+=speed*delta		
	_vida()
	print(vida)

func _on_enemigo_1_area_entered(area: Area2D) -> void:
	if area.is_in_group("proyectil"):
		vida -=1

func _vida():
	if vida <= 0:
		Global.cash += 100
		queue_free()
