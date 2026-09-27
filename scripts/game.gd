extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Gamemanager.End_screen.connect(_on_game_end)
	
	
func _on_game_end() ->void:
	get_tree().change_scene_to_file("res://scenes/end_screen.tscn")
