extends Control

@onready var scoreValue: Label = %scoreValue
@onready var highScoreValue: Label = %highScoreValue2

@onready var aud = $AudioRose

@onready var audB1 = $VBoxContainer2/boxBotoes/replay/AudioB1
@onready var audB2 = $VBoxContainer2/boxBotoes/menu/AudioB2

func fadeIn():
	var maxVol = 0.0
	var temp = 1.0
	var step = 0.1
	
	for i in range(int(temp/step)):
		aud.volume_db = lerp(aud.volume_db, maxVol, step/temp)
		await get_tree().create_timer(step).timeout
		
func _ready() -> void:
	aud.volume_db = -40
	aud.play()
	fadeIn()
	
	if DadosGlobais.highScore < DadosGlobais.score:
		DadosGlobais.highScore = DadosGlobais.score
		
	scoreValue.text = str(DadosGlobais.score)
	highScoreValue.text = str(DadosGlobais.highScore)

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
			
			
func _on_replay_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/cena_jogo_2.tscn")
	DadosGlobais.score = 0
	DadosGlobais.startBool = false
	DadosGlobais.tempGlobal = true


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/TelaInicial.tscn")
	DadosGlobais.score = 0
	DadosGlobais.startBool = false
	DadosGlobais.tempGlobal = true


func _on_replay_mouse_entered() -> void:
	audB1.play()
	
func _on_menu_mouse_entered() -> void:
	audB2.play()
