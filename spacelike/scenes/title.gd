extends Control

# Move the starfield slowly across the screen
func _process(delta):
	$Starfield.position.x += delta * 10 # Slowly move to the right
	# Wrap around when moving too far
	if $Starfield.position.x > get_viewport().size.x:
		$Starfield.position.x = 0
