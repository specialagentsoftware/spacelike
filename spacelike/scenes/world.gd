extends Node2D
@onready var startpoint: Marker2D = $Startpoint

func _ready() -> void:
	var player_ship = SCM.selected_ship
	add_child(player_ship)
	player_ship.position = startpoint.position
	print(SCM.get_ship_specs())
	
