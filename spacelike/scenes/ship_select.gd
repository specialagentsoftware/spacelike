extends Node2D

@export var star_count: int = 2000  # Number of stars to generate
@export var space_size: Vector2 = Vector2(4000, 4000)  # The size of the space area
@export var customize_screen: PackedScene
const HEAVY_TANK = preload("res://objects/ships/heavy_tank.tscn")
const SMALL_SCOUT = preload("res://objects/ships/small_scout.tscn")

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


func _on_heavy_tank_button_pressed() -> void:
	SCM.set_ship(HEAVY_TANK)
	SM.go_to_customization()


func _on_lght_scout_button_pressed() -> void:
	SCM.set_ship(SMALL_SCOUT)
	SM.go_to_customization()


func _on_balanced_fighter_button_pressed() -> void:
	SM.go_to_customization()
