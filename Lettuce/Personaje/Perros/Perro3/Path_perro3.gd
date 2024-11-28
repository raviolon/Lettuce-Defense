extends PathFollow2D

var velocidad = 90

func _process(delta):
	progress += velocidad * delta
	pass
