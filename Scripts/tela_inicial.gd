extends Control



func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	
	if Input.is_action_just_pressed("ui_fullscreen"):
		if DadosGlobais.telaCheia == false:
			DisplayServer.window_set_mode(DisplayServer.WindowMode.WINDOW_MODE_FULLSCREEN)
			#await get_tree().create_timer(1).timeout
			DadosGlobais.abilitarFullscreen()
		else:
			DisplayServer.window_set_mode(DisplayServer.WindowMode.WINDOW_MODE_WINDOWED)
			#await get_tree().create_timer(1).timeout
			DadosGlobais.abilitarFullscreen()

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/cena_jogo_2.tscn")
	
func _on_quit_pressed() -> void:
	get_tree().quit()
