extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Musica.play_music()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_jugar_pressed():
	get_tree().change_scene_to_file("res://Escenas/Mapa1.tscn")


func _on_salir_pressed():
	get_tree().change_scene_to_file("res://Escenas/Menu.tscn")


func _on_nivel_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/Mapa2.tscn")
