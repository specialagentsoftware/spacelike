extends Node2D

@onready var main_viewport_world: World2D = get_viewport().world_2d
@onready var minimap_viewport: Viewport = $CanvasLayer/SubViewportContainer/SubViewport  # Adjust this path to where your minimap Viewport is

# Settings for the sector
var sector_size: int = 8192  # Size of the entire space sector
var chunk_size: int = 2048   # Size of each chunk
var player: Node2D           # Reference to the player
var loaded_chunks = {}       # Dictionary to keep track of loaded chunks
var chunk_pool = []          # Pool of reusable chunk nodes

@onready var startpoint: Marker2D = $Startpoint

@export var star_sprites = []
@export var asteroid_sprites = []
@export var planet_sprites = []

# Signal when a chunk is loaded (for loading animations, effects, etc.)
signal chunk_loaded(chunk_position)

func _ready():
	minimap_viewport.world_2d = main_viewport_world
	# Assuming SCM.selected_ship is your player's node
	player = SCM.selected_ship
	add_child(player)
	player.position = startpoint.position
	player.z_index = 3  # Make sure player is in front of everything

	# Initialize the chunk pool
	_initialize_chunk_pool()

	call_deferred("_update_chunks")

func _process(delta):
	_update_chunks()
	
# Initializes a pool of reusable chunks (for performance)
func _initialize_chunk_pool():
	for i in range(10):  # Create an arbitrary number of chunk nodes to reuse
		var chunk = _create_chunk()
		chunk.visible = false
		add_child(chunk)
		chunk_pool.append(chunk)

# Updates chunks around the player based on their position
func _update_chunks():
	var player_chunk_pos = Vector2(
		int(player.global_position.x / chunk_size),
		int(player.global_position.y / chunk_size)
	)

	for x in range(player_chunk_pos.x - 1, player_chunk_pos.x + 2):
		for y in range(player_chunk_pos.y - 1, player_chunk_pos.y + 2):
			var chunk_key = Vector2(x, y)

			if not loaded_chunks.has(chunk_key):
				var chunk = _load_chunk(chunk_key)
				loaded_chunks[chunk_key] = chunk
				emit_signal("chunk_loaded", chunk_key)

# Loads or generates a new chunk of space (stars, asteroids, etc.)
func _load_chunk(chunk_position: Vector2):
	# Reuse chunk from pool if available
	var chunk = chunk_pool.pop_back() if chunk_pool.size() > 0 else _create_chunk()
	chunk.position = chunk_position * chunk_size
	chunk.visible = true
	_populate_chunk(chunk, chunk_position)
	return chunk

# Populates a chunk with space elements (stars, asteroids, planets)
func _populate_chunk(chunk: Node2D, chunk_position: Vector2):
	var rng = RandomNumberGenerator.new()
	rng.seed = int(chunk_position.x * chunk_position.y)

	# Stars
	for i in range(rng.randi_range(50, 120)):
		var star = _create_star()
		star.position = Vector2(rng.randf_range(0, chunk_size), rng.randf_range(0, chunk_size))
		star.scale = Vector2(rng.randf_range(0.5, 1.5), rng.randf_range(0.5, 1.5))
		star.modulate = Color(1.0, rng.randf_range(0.8, 1.0), rng.randf_range(0.8, 1.0))
		star.z_index = 0
		chunk.add_child(star)

	# Asteroids
	for i in range(rng.randi_range(5, 10)):
		var asteroid = _create_asteroid(rng)
		asteroid.position = Vector2(rng.randf_range(0, chunk_size), rng.randf_range(0, chunk_size))
		asteroid.scale = Vector2(rng.randf_range(0.4, 1.2), rng.randf_range(0.4, 1.2))
		asteroid.z_index = 1
		chunk.add_child(asteroid)

	# Planets
	if rng.randf() < 0.3:
		var planet = _create_planet(rng)
		planet.position = Vector2(rng.randf_range(0, chunk_size), rng.randf_range(0, chunk_size))
		planet.scale = Vector2(rng.randf_range(1.0, 1.5), rng.randf_range(1.0, 1.5))
		planet.z_index = 2
		chunk.add_child(planet)

# Function to create a new chunk (or load a chunk scene)
func _create_chunk() -> Node2D:
	return Node2D.new()

# Example function for generating stars
func _create_star() -> Sprite2D:
	var star = Sprite2D.new()
	star.texture = star_sprites[randi() % star_sprites.size()]
	return star

# Example function for generating asteroids
func _create_asteroid(rng: RandomNumberGenerator) -> Sprite2D:
	var asteroid = Sprite2D.new()
	asteroid.texture = asteroid_sprites[rng.randi_range(0, asteroid_sprites.size() - 1)]
	return asteroid

# Example function for generating planets
func _create_planet(rng: RandomNumberGenerator) -> Sprite2D:
	var planet = Sprite2D.new()
	planet.texture = planet_sprites[rng.randi_range(0, planet_sprites.size() - 1)]
	return planet
