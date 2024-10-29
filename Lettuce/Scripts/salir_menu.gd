extends Button

var enemigos = preload("res://Escenas/Enemigos.tscn")

func _ready() -> void:
	pass
func _on_button_pressed() -> void:
	pass


func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/Menu.tscn")
