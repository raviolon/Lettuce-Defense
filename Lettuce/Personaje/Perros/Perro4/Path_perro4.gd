extends PathFollow2D

var velocidad = 80

func _process(delta):
	progress += velocidad * delta
	pass
