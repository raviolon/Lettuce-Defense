extends CanvasLayer

func _process(delta: float) -> void:
	$Dinero.text = str("Dinero: ",Global.cash)
	$Nivel.text = str("Nivel: ",Global.nivel)
