extends Area2D

var caindo: bool = false
var trigado: bool = false

@export var time_to_fall : float = 0.5
var gravidade = 200

@onready var pInicial: Vector2 = position
@onready var cenaDeath = load("res://Scenes/deathCollider.tscn")

var cair: bool = false
var scale_factor = 1


	
func _process(delta):
	if cair:
		position.y += gravidade*delta
		scale_factor -= 2 * delta
		scale = Vector2(scale_factor, scale_factor)
	
	if scale_factor <= 0:
		queue_free()

func istanceDeath():
	var deathCo = cenaDeath.instantiate()
	deathCo.instanciado = true
	deathCo.position = pInicial
	get_parent().add_child(deathCo) 

func _on_body_entered(body: Node2D) -> void:
	if DadosGlobais.startBool:
		if body.name == "Kombi":
			print("colidiu carro")
			await get_tree().create_timer(time_to_fall).timeout
			cair = true
			z_index = 0
			await get_tree().create_timer(time_to_fall/2).timeout
			istanceDeath()

#func _on_body_exited(body: Node2D) -> void:
	#if body.name == "Kombi":
		#body.saiuChao()
