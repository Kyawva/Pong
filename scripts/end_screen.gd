extends Node2D
@onready var label: Label = $Label
@onready var button: Button = $Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = Gamemanager.Character_winner + " has " + Gamemanager.win_or_lose


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
