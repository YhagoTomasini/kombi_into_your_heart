extends Node2D

var telaCheia: bool = false

@onready var scoreValue: Label = %ScoreValue
@onready var highScoreValue: Label = %HighScoreValue

func abilitarFullscreen():
	if telaCheia:
		telaCheia = false
	else:
		telaCheia = true

func _process(delta):
	scoreValue.text = str(DadosGlobais.score)
	highScoreValue.text = str(DadosGlobais.highScores)
	
	#____________________________________________________________#
	
	if Input.is_action_just_pressed("ui_restart"):
		get_tree().change_scene_to_file("res://Scenes/cena_jogo_2.tscn")
		DadosGlobais.startBool = false
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	
	if Input.is_action_just_pressed("ui_fullscreen"):
		if !telaCheia:
			DisplayServer.window_set_mode(DisplayServer.WindowMode.WINDOW_MODE_FULLSCREEN)
			#await get_tree().create_timer(1).timeout
			abilitarFullscreen()
		else:
			DisplayServer.window_set_mode(DisplayServer.WindowMode.WINDOW_MODE_WINDOWED)
			#await get_tree().create_timer(1).timeout
			abilitarFullscreen()
