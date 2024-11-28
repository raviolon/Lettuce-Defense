extends CanvasLayer

var presionado = false
var color_rect

func _ready():
	color_rect = get_node("ColorRect")
	color_rect.visible = false  

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Pausa"):
		if color_rect.visible:  
			color_rect.visible = false
			get_tree().paused = false  
		else:  
			color_rect.visible = true
			get_tree().paused = true  
		presionado = true  #


func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Escenas/Menu.tscn")


func _on_timer_perro_5_timeout() -> void:
	pass 


func _on_asd_pressed() -> void:
	pass 
