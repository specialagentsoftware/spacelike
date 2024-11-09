extends player

func _ready() -> void:
	acceleration = 110.0  # Faster acceleration
	turning_speed = 1.0   # Higher turning speed
	drag = 0.04           # Light drag
	max_speed = 300.0
	print("Medium ship ready")
