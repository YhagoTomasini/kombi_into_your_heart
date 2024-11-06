extends CharacterBody2D

const SPEED = 140
const ACCELARATION = 5

var wheel_base = 24
var steering_angle = 15

var steer_direction

var grounded: bool = true
var gravity = 1

var input = Vector2.ZERO

func _physics_process(delta):
	
	if grounded:		
		input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		
		if Input.get_action_strength("ui_paste"):
			grounded = false
	else:
		input.y += gravity*delta
		rotation += 0.1

	velocity = lerp(velocity, input*SPEED, ACCELARATION*delta)	
	move_and_slide()
	#
	#for i in range(get_slide_collision_count()):
		#var collision = get_slide_collision(i)
		#if collision and collision.collision:
			#if collision.collision.has_method("Colidido"):
				#collision.collision.Colidido(collision, self)

	
	$Sprite2D.dam_rotation(velocity.angle()-deg_to_rad(-90))

	if input != Vector2.ZERO:
		$GPUParticles2D.rotation = (velocity.angle()-deg_to_rad(-90))
		if grounded:
			$GPUParticles2D.emitting = true
		else:
			$GPUParticles2D.emitting = false
	else:
		$GPUParticles2D.emitting = false
	#get_input()
	#calculate_steering(delta)
	#move_and_slide()
	
#func get_input():
	#var turn = 0
	#
	#if Input.get_action_strength("ui_right"):
		#turn += 1
	#if Input.get_action_strength("ui_left"):
		#turn -= 1
		#
	#steer_direction = turn*steering_angle
	#velocity = Vector2.ZERO
	#
	#if Input.get_action_strength("ui_up"):
		#velocity = transform.x*140
	#
	#if steer_direction != 0:
		#$Sprite2D.dam_rotation(velocity.angle()-deg_to_rad(-90))
		#
#func calculate_steering(delta):
	#var rear_wheel = position - transform.x*wheel_base/2
	#var front_wheel = position + transform.x*wheel_base/2
	#rear_wheel += velocity*delta
	#front_wheel += velocity.rotated(steer_direction)*delta
	#
	#var new_heading = (front_wheel - rear_wheel).normalized()
	#velocity = new_heading*velocity.length()
	#
	#rotation = new_heading.angle()
	
	
