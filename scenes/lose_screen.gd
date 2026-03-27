extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_retry_button_pressed():
	Global.lives = 3 
	if Global.current_level_path != "":
		get_tree().change_scene_to_file(Global.current_level_path)
	else:
		get_tree().change_scene_to_file("res://scenes/Level1.tscn") 

func _on_main_menu_button_pressed():
	Global.lives = 3 
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
