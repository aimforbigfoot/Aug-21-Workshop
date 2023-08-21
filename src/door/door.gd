extends Area2D

@export var levelToGoTo := "res://src/level_2.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", bodyEntered)

func bodyEntered(body:Node2D) -> void:
	if body.name == "player":
		get_tree().change_scene_to_file(levelToGoTo)
		
		
		
