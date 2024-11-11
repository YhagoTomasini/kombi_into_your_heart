extends Area2D

func _ready() -> void:
	$Sprite2D.visible = false
	
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Kombi":
			print("colidiu carro")
			body.saiuChao()
