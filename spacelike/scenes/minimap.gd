extends CanvasLayer

@onready var player: RigidBody2D = get_tree().get_first_node_in_group("player")
@onready var camera: Camera2D = $MiniMap/SubViewportContainer/SubViewport/Camera2D
@onready var sub_viewport: SubViewport = $MiniMap/SubViewportContainer/SubViewport


func _ready() -> void:
	if player:
		camera.make_current()
		camera.add_child(player)

func _process(delta: float) -> void:
	if player:
		# Update camera position to match player
		camera.position = player.global_position
		# Zoom out the minimap view for a wider perspective
		camera.zoom = Vector2(.25, .25)  # Adjust this as needed for zoom level
