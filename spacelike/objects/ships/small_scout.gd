extends player

func _ready() -> void:
	acceleration = 170.0  # Faster acceleration
	turning_speed = 2.0   # Higher turning speed
	drag = 0.08           # Light drag
	max_speed = 500.0     # Maximum speed for the ship
	print("Light scout ready")
