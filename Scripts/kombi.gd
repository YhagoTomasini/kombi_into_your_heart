extends CharacterBody2D

const SPEED = 140
const ACCELARATION = 5

var wheel_base = 24
var steering_angle = 15

var steer_direction

var grounded: bool = true
#var grounded2: bool = true

var gravity = 200
var scale_factor = 1.0
var time_to_fall = 0.3

var input = Vector2.ZERO

func _physics_process(delta):
	if grounded:
		input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		
		if Input.get_action_strength("ui_paste"):
			grounded = false
			
	elif !grounded:
		print("caindo ahhh")
		#$Camera2D.enabled = false
		collision_layer = 1
		z_index = 1
		position.y += gravity*delta
		scale_factor -= 1.5 * delta
		scale = Vector2(scale_factor, scale_factor)
		#rotation += 0.1
		
	if scale_factor <= 0:
		queue_free()
		
	velocity = lerp(velocity, input*SPEED, ACCELARATION*delta)
	$Sprite2D.dam_rotation(velocity.angle()-deg_to_rad(-90))
	
	move_and_slide()
	
	if input != Vector2.ZERO:
		$GPUParticles2D.rotation = (velocity.angle()-deg_to_rad(-90))
		if grounded:
			$GPUParticles2D.emitting = true
		else:
			$GPUParticles2D.emitting = false
	else:
		$GPUParticles2D.emitting = false
	
func saiuChao():
	await get_tree().create_timer(time_to_fall).timeout
	print("saiu do chao")
	grounded = false
	
	
