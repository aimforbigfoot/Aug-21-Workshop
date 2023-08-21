extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button.connect("pressed", pressedBtn)

func pressedBtn() -> void:
	get_tree().change_scene_to_file("res://src/world.tscn")
