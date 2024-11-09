extends SpecialAbility

var cloak_duration: float = 3.0  # Time the ship stays cloaked
var cloak_active: bool = false

# Activate the cloak
func activate():
	if can_activate():
		cloak_active = true
		#SCM.selected_ship.visible = false  # Make the ship invisible
		SCM.selected_ship.modulate.a = .5
		SCM.selected_ship.modulate = Color(0,.5,0)
		#SCM.selected_ship.set_physics_process(false)  # Disable collisions (invulnerability)
		var cloak_time = Timer.new()
		cloak_time.connect("timeout", _on_Timer_timeout)
		self.add_child(cloak_time)
		cloak_time.start(cloak_duration)  # Re-enable after the duration

# Automatically end cloak after duration
func _on_Timer_timeout():
	cloak_active = false
	SCM.selected_ship.modulate.a = 1
	SCM.selected_ship.modulate = Color(1,1,1)
	#SCM.selected_ship.visible = true
	#SCM.selected_ship.set_physics_process(true)
