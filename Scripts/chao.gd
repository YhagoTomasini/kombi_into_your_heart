extends Area2D

var caindo: bool = false
var trigado: bool = false

@export var time_to_fall : float = 0.5
@export var time_to_delete : float = 1.0
var gravidade = 200

var cair: bool = false
#var corpo = Vector2.ZERO

func _process(delta):
	if cair:
		position.y += gravidade*delta

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Kombi":
			print("colidiu")
			await get_tree().create_timer(time_to_fall).timeout
			cair = true
			await get_tree().create_timer(time_to_delete).timeout
			queue_free()
