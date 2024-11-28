extends CanvasLayer

func _process(delta: float) -> void:
	$Dinero.text = str("Dinero: ",Global.cash)
	$Nivel.text = str("Nivel: ",Global.nivel)
	$Ronda.text = str("Ronda: ",Mundo1.ronda)
