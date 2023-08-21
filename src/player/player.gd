extends CharacterBody2D

const SPEED := 250.0
const GRAVITY := 50
const JUMP_STRENGTH := -750
var ySpeed := 0.0
var jumpCount := 0
const MAX_JUMP_COUNT := 3



func getXInput() -> float:
	return Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_right") or Input.is_action_just_pressed("ui_left"):
		$AnimatedSprite2D.play("run")
	if Input.is_action_just_released("ui_right") or Input.is_action_just_released("ui_left"):
		$AnimatedSprite2D.play("default")

func _physics_process(delta: float) -> void:
#	platformer logic 
	var xSpeed := getXInput() * SPEED
	if !is_on_floor():
		ySpeed += GRAVITY
	else:
		ySpeed = 0
		jumpCount = 0
	if is_on_ceiling():
		ySpeed += GRAVITY
#	animation stuff
	if sign(xSpeed) == -1:
		$AnimatedSprite2D.flip_h = true
	elif sign(xSpeed) == 1:
		$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.play("default")
	if is_on_floor() and xSpeed:
		$AnimatedSprite2D.play("run")
	if Input.is_action_just_pressed("ui_up") and jumpCount <= MAX_JUMP_COUNT:
		ySpeed = 0
		ySpeed += JUMP_STRENGTH
		jumpCount += 1
		$AnimatedSprite2D.play("jump")
	
	velocity = Vector2( xSpeed, ySpeed)
	move_and_slide()

func die() -> void:
	get_tree().change_scene_to_file("res://src/UI_Scenes/game_over.tscn")
	pass
