extends Node

var score = 0
var highScore = 0

@onready var startBool: bool = false
@onready var mudarCorChao: bool = false

var telaCheia: bool = false

var souma: bool = false

func _process(delta: float) -> void:
	if souma and mudarCorChao:
		mudasaporra()
		souma = false
		
func mudasaporra():
	await get_tree().create_timer(0.5).timeout
	DadosGlobais.mudarCorChao = false
		
func morte():
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://Scenes/tela_final.tscn")

func abilitarFullscreen():
	if telaCheia:
		telaCheia = false
	else:
		telaCheia = true
