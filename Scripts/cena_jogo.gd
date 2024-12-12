extends Node2D



@onready var scoreValue: Label = %ScoreValue
@onready var highScoreValue: Label = %HighScoreValue



func _process(delta):
	scoreValue.text = str(DadosGlobais.score)
	highScoreValue.text = str(DadosGlobais.highScore)
	
	#____________________________________________________________#
	
	if Input.is_action_just_pressed("ui_restart"):
		get_tree().change_scene_to_file("res://Scenes/cena_jogo_2.tscn")
		DadosGlobais.startBool = false
		DadosGlobais.score = 0
		DadosGlobais.tempGlobal = true
		
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
