extends SpecialAbility

var cloak_duration: float = 3.0  # Time the ship stays cloaked
var cloak_active: bool = false

# Activate the cloak
func activate():
	pass
	#if can_activate():
	#    cloak_active = true
	#    owner.visible = false  # Make the ship invisible
	#    owner.set_physics_process(false)  # Disable collisions (invulnerability)
	#    Timer.new().start(cloak_duration)  # Re-enable after the duration
	#    .activate()

# Automatically end cloak after duration
func _on_Timer_timeout():
	cloak_active = false
	owner.visible = true
	owner.set_physics_process(true)
