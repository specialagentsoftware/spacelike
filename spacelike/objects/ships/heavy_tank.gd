extends player

func _ready() -> void:
	acceleration = 60.0    # Slower acceleration
	turning_speed = 0.2    # Lower turning speed
	drag = 0.02            # Heavier drag (less)
	max_speed = 100.0
	print("Heavy is ready")
