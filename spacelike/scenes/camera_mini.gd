extends Camera2D

var current_target: Node2D = null  # The player or object to follow
var follow_speed: float = 13.0  # Speed of the camera catching up
var min_distance: float = 0.0  # Minimum distance before the camera starts moving

func _ready():
	var main_camera = get_tree().get_first_node_in_group("main_canera")
	find_player()
	get_tree().connect("node_added", Callable(self, "_on_node_added"))
	self.make_current()

func _process(delta):
	if current_target:
		# Get the player's position
		var target_position = current_target.global_position

		# Move the camera smoothly towards the player's position using lerp
		global_position = global_position.lerp(target_position, follow_speed * delta)

		# Optional: You can add a check to only move the camera when the player moves far enough away
		if global_position.distance_to(target_position) > min_distance:
			global_position = global_position.lerp(target_position, follow_speed * delta)

# Function to find the player node in the "player" group
func find_player():
	var players = get_tree().get_nodes_in_group("player")
	if players.size() > 0:
		current_target = players[0]  # Follow the first player found
	else:
		current_target = null

# Signal callback for when a new node is added to the scene tree
func _on_node_added(node):
	if node.is_in_group("player"):
		current_target = node  # Set the new player as the target
