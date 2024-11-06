#extends RigidBody2D
#
#@export var gravity : float = 1
#@export var time_to_fall : float = 0.5
#@export var time_to_delete : float = 1.0
#
##var caindo: bool = false
#
#func _process(delta):
	#transform.y += gravity*delta
#
#
#func _on_body_entered(body):
	## if the body is a player, turn gravity on and delete itself after a while
	#if body.name == "Kombi":
		#print("colidiu")
		#await get_tree().create_timer(time_to_fall).timeout
		#caindo = true
		#await get_tree().create_timer(time_to_delete).timeout
		#queue_free()
