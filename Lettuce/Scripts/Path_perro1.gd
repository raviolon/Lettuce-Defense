extends PathFollow2D

var velocidad = 100

func _process(delta):
	progress += velocidad * delta
	pass
