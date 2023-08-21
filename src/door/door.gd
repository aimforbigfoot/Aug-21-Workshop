extends Area2D

@export var levelToGoTo := ""

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", bodyEntered)

func bodyEntered(body:Node2D) -> void:
	if body.name == "player":
		print("yay level done")
		
