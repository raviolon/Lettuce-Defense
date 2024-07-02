extends Control

func resume():
	get_tree().paused = false

func pause():
	get_tree().paused = true


func testEsc():
	if Input.is_action_just_pressed("esc") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused:
		resume()


func _on_volver_pressed():
	resume()


func _on_menu_principal_pressed():
	get_tree().change_scene_to_file("res://Escenas/Menu.tscn")

func _process(delta):
	testEsc()

