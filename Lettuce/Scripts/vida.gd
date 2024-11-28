extends CanvasLayer

func _process(delta: float) -> void:
	$Vida.text = str ("VIDA = ", Global.vida)
	
