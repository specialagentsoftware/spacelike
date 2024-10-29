extends Node
class_name SceneManager

@onready var title_screen: PackedScene = preload("res://scenes/title.tscn")
@onready var character_select: PackedScene = preload("res://scenes/ship_select.tscn")
@onready var character_customization: PackedScene = preload("res://scenes/ship_customization.tscn")
@onready var world = preload("res://scenes/world.tscn")

func go_to_title() -> void:
	get_tree().change_scene_to_packed(title_screen)
	
func go_to_select() -> void:
	get_tree().change_scene_to_packed(character_select)

func go_to_customization() -> void:
	get_tree().change_scene_to_packed(character_customization)

func gp_to_world() -> void:
	get_tree().change_scene_to_packed(world)
