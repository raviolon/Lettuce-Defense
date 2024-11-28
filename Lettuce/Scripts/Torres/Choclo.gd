extends Node2D

var municion = preload("res://Escenas/Balas/BalasChoclo.tscn")
var shoot = true
var target_position = null
var velocidad = 10
var construccion = false
var offset = Vector2.ZERO  
var area_valida = true
func _ready():
	connect("input_event", Callable(self, "_on_construc_input_event"))

func _process(_delta):
	_alert()
	
	if construccion:
		shoot = false
	elif target_position and shoot:
		$Verdura.look_at(target_position)
		var b = municion.instantiate()
		b.global_position = global_position
		b.rotation = $Verdura.global_rotation
		get_tree().current_scene.add_child(b)
		b.global_position = target_position
		target_position = null
		shoot = false

func _on_rango_area_entered(area):
	if shoot and area.is_in_group("Enemigos"):
		target_position = area.global_position
		shoot = true

func _alert():
	if $Rango/CollisionShape2D.disabled:
		$Rango/CollisionShape2D.disabled = false
		shoot = true

func _on_detencion_timeout():
	$Rango/CollisionShape2D.disabled = true
	target_position = null

func set_construccion(state: bool) -> void:
	construccion = state


func _on_construccionhitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("Torres"):  
		print("No se permite posicionar aquí.")
		area_valida = false
	pass


func _on_construccionhitbox_area_exited(area: Area2D) -> void:
	if area.is_in_group("Torres"):
		area_valida = true
	pass 
