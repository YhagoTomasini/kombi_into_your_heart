extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Kombi":
		print("Vida extra")
		queue_free()
