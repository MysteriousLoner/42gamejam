extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var yeeting = false
var freeze = false
var jump = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if freeze == true:
		$AnimationPlayer.play("idle")
		return
	if is_on_ceiling() or is_on_floor():
		jump = false
		yeeting = false
	velocity.y += gravity * delta
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump = true
		velocity.y = JUMP_VELOCITY
	elif Input.is_action_just_pressed("jump") and is_on_ceiling():
		jump = true
		velocity.y = -JUMP_VELOCITY
	elif Input.is_action_just_pressed("jump") and !is_on_floor() and !is_on_ceiling() and yeeting == false and jump == true:
			yeeting = true
			gravity = -gravity
			if gravity > 0:
				velocity.y = -JUMP_VELOCITY
			elif gravity < 0:
				velocity.y = JUMP_VELOCITY
			if $Player.flip_v == false:
				$Player.flip_v = true
			else:
				$Player.flip_v = false
	if velocity.x == 0:
		$AnimationPlayer.play("idle")
	elif Input.is_action_pressed("left") and (is_on_floor() or is_on_ceiling()):
		if !Input.is_action_pressed("right"):
			$Player.flip_h = true
		$AnimationPlayer.play("walk")
	elif Input.is_action_pressed("right") and (is_on_floor() or is_on_ceiling()):
		if !Input.is_action_pressed("left"):	
			$Player.flip_h = false
		$AnimationPlayer.play("walk")
	elif Input.is_action_pressed("left") and !is_on_floor() and !is_on_ceiling():
		if !Input.is_action_pressed("right"):
			$Player.flip_h = true
		$AnimationPlayer.play("idle")
	elif Input.is_action_pressed("right") and !is_on_floor() and !is_on_ceiling():
		if !Input.is_action_pressed("left"):
			$Player.flip_h = false
		$AnimationPlayer.play("idle")
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

func freeze_movement(value) -> void:
	print("value: ", value)
	if value == 1:
		freeze = true
	elif value == 0:
		freeze = false
	print("here")

func player():
	pass
