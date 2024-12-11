@tool
extends Sprite2D

@onready var dgCode: Node = get_node("/root/DadosGlobais")

@export var show_sprites: bool = false
@export var rotate_sprites: bool = false

var animTex: AnimatedTexture

var distLayers: int = 1
	
func set_show_sprites(_show_sprites):
	show_sprites = _show_sprites
	if show_sprites:
		render_sprites()
	else:
		clear_sprites
		
func dam_rotation(_rotation):
	for sprite in get_children():
		sprite.rotation = _rotation

func set_rotate_sprites(_rotate_sprites):
	rotate_sprites = _rotate_sprites
#
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cut"):
		distLayers += 1
		render_sprites()
	elif Input.is_action_just_pressed("ui_copy"):
		distLayers -= 1
		render_sprites()
	elif Input.is_action_just_pressed("ui_undo"):
		distLayers = 1
		render_sprites()
	
	if rotate_sprites:
		for sprite in get_children():
			sprite.rotation += delta

	#if DadosGlobais and DadosGlobais.has("mudarCorChao"):
		#await get_tree().create_timer(1).timeout
	#if dgCode.mudarCorChao:
		#corChao(1)
		#await get_tree().create_timer(0.1).timeout
		#dgCode.mudarCorChao = false

func corChao(nCor: int):
	if texture is AnimatedTexture:
		animTex = texture as AnimatedTexture
		animTex.current_frame = nCor
		await get_tree().create_timer(0.5).timeout
		animTex.current_frame = 0
		#DadosGlobais.mudarCorChao = false

func clear_sprites():
	for sprite in get_children():
		sprite.queue_free()

func _ready():
	corChao(0)
		
	await get_tree().create_timer(0.1).timeout
	render_sprites()
	#dam_rotation()
	distLayers = 1

func render_sprites():
	clear_sprites()
	for i in range(0, hframes):
		var next_sprite = Sprite2D.new()
		
		next_sprite.texture = texture
		next_sprite.hframes = hframes
		next_sprite.frame = i
		next_sprite.position.y = 16-(i/2)*distLayers
		
		var nRandom = randi_range(0, 3)
		next_sprite.rotation_degrees = 90 * nRandom
		
		#next_sprite.flip_h = true
		
		add_child(next_sprite)
