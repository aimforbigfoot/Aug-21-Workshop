extends CharacterBody2D
@export var jumpStrength := -800.0
var isAlive := true
var ySpeed := 0
var xSpeed := 80
const GRAVITY := 100

func _ready() -> void:
	$Timer.connect("timeout", jump)
	$bodyChecker.connect("body_entered", bodyEntered)


func bodyEntered(body:Node2D) -> void:
	if body != self:
		xSpeed *= -1
	if body.name == "player" and isAlive:
		if body.global_position.y < global_position.y:
			xSpeed = 0 
			$AnimatedSprite2D.play("dead")
			$bodyChecker/CollisionShape2D.queue_free()
			isAlive = false
			set_physics_process(false)
		else:
			body.die() #lots to talk abt with doing smth like this
			
	
	
func _physics_process(delta: float) -> void:
	if !is_on_floor():
		ySpeed += GRAVITY
	velocity = Vector2(xSpeed, ySpeed)
	move_and_slide()

func jump() -> void:
	ySpeed = 0
	ySpeed += jumpStrength
