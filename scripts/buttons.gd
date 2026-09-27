extends Node2D


func _on_player_v_player_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Game.tscn")


func _on_player_v_ai_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/pong_ai_game.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
