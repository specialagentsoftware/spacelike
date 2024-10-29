extends RigidBody2D

# Ship stats
var acceleration: float = 150.0  # Faster acceleration
var turning_speed: float = 3.0   # Higher turning speed
var drag: float = 0.05           # Light drag

# Weapons, defense systems, and abilities
var primary_weapon: PackedScene = preload("res://objects/weapons/primary/laser_cannon.tscn")
var secondary_weapon: PackedScene = preload("res://objects/weapons/secondary/emp.tscn")
var defense_system: PackedScene = preload("res://objects/defensive_systems/shield.tscn")
var special_ability: PackedScene = preload("res://objects/special_abilities/cloak.tscn") 

# Physics values
var velocity: Vector2 = Vector2.ZERO

# Ability cooldowns
var can_fire_primary: bool = true
var can_fire_secondary: bool = true
var ability_active: bool = false

func _ready():
	print("Light Ship ready!")

# Main physics update function
func _physics_process(delta):
	handle_movement(delta)
	apply_drag(delta)

	handle_weapons()
	handle_defensive_systems()
	handle_special_abilities()

# Handles ship movement (thrust and rotation)
func handle_movement(delta):
	if Input.is_action_pressed("thrust"):  # 'W' for forward thrust
		apply_thrust(delta)
	
	if Input.is_action_pressed("turn_left"):  # 'A' for left turn
		rotate_left(delta)
	
	if Input.is_action_pressed("turn_right"):  # 'D' for right turn
		rotate_right(delta)

# Apply thrust in the forward direction
func apply_thrust(delta):
	var forward_direction = Vector2(cos(rotation), sin(rotation))
	velocity += forward_direction * acceleration * delta

# Apply rotation to the ship (left)
func rotate_left(delta):
	rotation -= turning_speed * delta

# Apply rotation to the ship (right)
func rotate_right(delta):
	rotation += turning_speed * delta

# Apply drag to slow down ship gradually
func apply_drag(delta):
	velocity = velocity.lerp(Vector2.ZERO, drag * delta)
	position += velocity * delta

# Handles firing weapons
func handle_weapons():
	if Input.is_action_pressed("fire_primary") and can_fire_primary:
		fire_primary_weapon()
	
	if Input.is_action_pressed("fire_secondary") and can_fire_secondary:
		fire_secondary_weapon()

func fire_primary_weapon():
	var weapon_instance = primary_weapon.instantiate()
	weapon_instance.position = position + Vector2(cos(rotation), sin(rotation)) * 10
	weapon_instance.rotation = rotation
	get_parent().add_child(weapon_instance)
	
	can_fire_primary = false
	await _set_cooldown(0.5, "primary_weapon_ready")  # Cooldown of 0.5 seconds
	can_fire_primary = true

func fire_secondary_weapon():
	var weapon_instance = secondary_weapon.instantiate()
	weapon_instance.position = position + Vector2(cos(rotation), sin(rotation)) * 10
	weapon_instance.rotation = rotation
	get_parent().add_child(weapon_instance)
	
	can_fire_secondary = false
	await _set_cooldown(1.5, "secondary_weapon_ready")  # Cooldown of 1.5 seconds
	can_fire_secondary = true

# Handles activating defensive systems (e.g., shields)
func handle_defensive_systems():
	if Input.is_action_just_pressed("defense"):
		activate_defense_system()

func activate_defense_system():
	var defense_instance = defense_system.instantiate()
	defense_instance.position = position
	get_parent().add_child(defense_instance)

# Handles using the special ability (e.g., speed boost)
func handle_special_abilities():
	if Input.is_action_just_pressed("special") and not ability_active:
		activate_special_ability()

func activate_special_ability():
	var ability_instance = special_ability.instantiate()
	ability_instance.position = position
	get_parent().add_child(ability_instance)
	
	ability_active = true
	await _set_cooldown(5, "ability_ready")  # Ability active for 5 seconds
	ability_active = false

# Function to create a cooldown using async/await
func _set_cooldown(duration: float, signal_name: String):
	var timer = Timer.new()
	timer.wait_time = duration
	timer.one_shot = true
	add_child(timer)
	timer.start()
	await timer.timeout
	timer.queue_free()
