extends Area2D

var caindo: bool = false
var trigado: bool = false

@export var time_to_fall : float = 0.5
@export var time_to_delete : float = 1.0
var gravidade = 200

var cair: bool = false
var scale_factor = 1
#var corpo = Vector2.ZERO

#func _ready():
	#for area in get_children():
		#if area is Area2D:
			#area.add_to_group("areas")
			
func _process(delta):
	if cair:
		position.y += gravidade*delta
		scale_factor -= 1.5 * delta
		scale = Vector2(scale_factor, scale_factor)
	
	if scale_factor <= 0:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Kombi":
		print("colidiu carro")
		body.taChao()
		await get_tree().create_timer(time_to_fall).timeout
		cair = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Kombi":
		body.saiuChao()
