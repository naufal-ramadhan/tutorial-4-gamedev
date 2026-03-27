extends Area2D

@export var sceneName: String = "LoseScreen"


func _on_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		if Global.lives != 1:
			Global.lives -=1
			get_tree().change_scene_to_file(Global.current_level_path)
		else:
			get_tree().change_scene_to_file(str("res://scenes/" + sceneName + ".tscn"))
