extends PathFollow2D

var velocidad = 50

func _process(delta):
	progress += velocidad * delta
	pass
