extends Area2D

@onready var pInicial: Vector2 = position
@onready var cenaChao = load("res://Scenes/chao.tscn")

var instanciado: bool = false

func _ready() -> void:
	$Sprite2D.visible = false
	await get_tree().create_timer(3).timeout
	if instanciado:
		istanceChao()
		queue_free()
	
func istanceChao():
	var chao = cenaChao.instantiate()
	chao.position = pInicial
	get_parent().add_child(chao) 
	
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Kombi":
			print("colidiu carro")
			body.saiuChao()
