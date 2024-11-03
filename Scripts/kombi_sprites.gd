@tool
extends Sprite2D

@export var show_sprites: bool = false
#@export var rotate_sprites: bool = false

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

#func set_rotate_sprites(_rotate_sprites):
	#rotate_sprites = _rotate_sprites
#
func _process(delta):
	if Input.is_action_just_pressed("ui_cut"):
		distLayers += 1
		render_sprites()
	elif Input.is_action_just_pressed("ui_copy"):
		distLayers -= 1
		render_sprites()
	elif Input.is_action_just_pressed("ui_undo"):
		distLayers = 1
		render_sprites()
	#if rotate_sprites:
		#for sprite in get_children():
			#sprite.rotation += delta
	#
func clear_sprites():
	for sprite in get_children():
		sprite.queue_free()

func _ready():
	render_sprites()
	distLayers = 1
	
func render_sprites():
	clear_sprites()
	for i in range(0, hframes):
		var next_sprite = Sprite2D.new()
		
		next_sprite.texture = texture
		next_sprite.hframes = hframes
		next_sprite.frame = i
		next_sprite.position.y = -i*distLayers
		next_sprite.flip_h = true
		
		add_child(next_sprite)
