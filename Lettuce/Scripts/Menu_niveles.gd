extends Control


func _ready():
	Musica.play_music()

func _process(delta):
	pass


func _on_nivel_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/Mapa1.tscn")


func _on_salir_pressed():
	get_tree().change_scene_to_file("res://Escenas/Menu.tscn")


func _on_nivel_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/Mapa2.tscn")


func _on_nivel_3_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/Mapa3.tscn")
