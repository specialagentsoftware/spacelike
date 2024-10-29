extends SpecialAbility

var overdrive_duration: float = 5.0
var speed_boost: float = 1.5
var damage_boost: float = 2.0

func activate():
	pass
	#if can_activate():
		# Temporarily increase speed and damage
	#    owner.max_speed *= speed_boost
	#    owner.primary_weapon.damage *= damage_boost
		
		# Start a timer to revert stats after the duration
	#    Timer.new().start(overdrive_duration)
	#    .activate()

func _on_Timer_timeout():
	# Revert stats back to normal after overdrive
	owner.max_speed /= speed_boost
	owner.primary_weapon.damage /= damage_boost
