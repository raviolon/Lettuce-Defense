extends Control


func _ready():
	Musica.play_music()

func _process(delta):
	pass

func _on_jugar_pressed():
	get_tree().change_scene_to_file("res://Escenas/Menu niveles/Menu_niveles.tscn")


func _on_salir_pressed():
	get_tree().quit()
