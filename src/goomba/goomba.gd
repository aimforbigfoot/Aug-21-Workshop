extends CharacterBody2D

const GRAVITY := 100
var ySpeed := 0
var xSpeed := 100
func _ready() -> void:
	$bodyChecker.connect("body_entered", bodyEntered)


func bodyEntered(body:Node2D) -> void:
	if body:
		xSpeed *= -1
	if body.name == "player":
		if body.global_position.y < global_position.y:
			xSpeed = 0 
			$AnimatedSprite2D.play("dead")
	

func _physics_process(delta: float) -> void:
	if !is_on_floor():
		ySpeed += GRAVITY
	velocity = Vector2(xSpeed, ySpeed)
	move_and_slide()
	
