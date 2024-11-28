extends PathFollow2D

var velocidad = 70

func _process(delta):
	progress += velocidad * delta
	pass
