extends Control

@onready var main_sceen = "res://main.tscn"

func _process(delta):
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file(main_sceen)
	queue_free()
