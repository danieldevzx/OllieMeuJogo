extends Node

var next_scene = preload("res://scenes/game.tscn")

func change_scene(scene_path: String) -> void:
	if scene_path == "":
		return
	get_tree().change_scene_to_file(scene_path)
	
func inicia():
	get_parent().change_scene("res://scenes/game.tscn")
	pass
