extends Area2D

@onready var ray = $RayCast2D
@onready var cenaHeart = load("res://Scenes/hearts.tscn")
@onready var render = $Heart_render

var noChao: bool = true
var pronto: bool = true

func _physics_process(delta: float) -> void:
	if pronto:
		if ray.is_colliding():
			#print("cahoTrue")
			noChao=true
		else:
			noChao=false
		
		await get_tree().create_timer(0.1).timeout
		pronto = false
	
func _ready() -> void:
	ray.enabled = true
	render.visible = false
	
	await get_tree().create_timer(0.1).timeout
	
	render.visible = true
	if !noChao:
		istanceHeart()
		queue_free()
		
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Kombi":
		print("Vida extra")
		DadosGlobais.score += 1
		
		if !DadosGlobais.mudarCorChao:
			DadosGlobais.souma = true
			DadosGlobais.mudarCorChao = true
			
			
		if !DadosGlobais.startBool:
			DadosGlobais.startBool = true
		istanceHeart()
		queue_free()

func istanceHeart():
	var heart = cenaHeart.instantiate()
	var nRand = Vector2(randi_range(0, 320), randi_range(0, 320))
	heart.position = normalaize16(nRand)
	get_parent().add_child(heart) 
	
	noChao = false
	
func normalaize16(position: Vector2, grid: int = 16) -> Vector2:
	return Vector2(round(position.x/grid)*grid, round(position.y/grid)*grid)

#func _on_area_entered(area: Area2D) -> void:
	#noChao = true
	#print("cahoTrue")
	
	
	
	
