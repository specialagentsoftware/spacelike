extends Node2D

@export var star_count: int = 2000  # Number of stars to generate
@export var space_size: Vector2 = Vector2(4000, 4000)  # The size of the space area

func _ready():
	randomize()  # Ensure randomness for star placement

	# Generate random stars
	for i in range(star_count):
		var star = Sprite2D.new()
		star.texture = preload("res://assets/star_texture.png")  # Preload a simple star texture
		star.position = Vector2(
			randf() * space_size.x,  # Random x position within space size
			randf() * space_size.y   # Random y position within space size
		)
		add_child(star)  # Add the star to the scene

# Move the starfield slowly across the screen
func _process(delta):
	$Starfield.position.x += delta * 20
	if $Starfield.position.x > get_viewport().size.x:
		$Starfield.position.x = 0


func _on_start_pressed() -> void:
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	pass # Replace with function body.
